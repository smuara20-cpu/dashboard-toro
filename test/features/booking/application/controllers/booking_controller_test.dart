import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/controllers/booking_controller.dart';
import 'package:dashboard_kpi/features/booking/application/state/booking_state.dart';
import 'package:dashboard_kpi/features/booking/application/usecases/create_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/application/usecases/delete_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/application/usecases/get_booking_by_id_usecase.dart';
import 'package:dashboard_kpi/features/booking/application/usecases/get_bookings_usecase.dart';
import 'package:dashboard_kpi/features/booking/application/usecases/update_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/payment_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/enums/booking_status.dart'
    as domain_booking;
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';

class FakeBookingRepository implements BookingRepository {
  List<BookingEntity> bookings = [];
  Object? getBookingsError;

  @override
  Future<List<BookingEntity>> getBookings() async {
    if (getBookingsError != null) {
      throw getBookingsError!;
    }

    return List.unmodifiable(bookings);
  }

  @override
  Future<BookingEntity?> getBookingById(String id) async {
    return bookings.where((booking) => booking.id == id).firstOrNull;
  }

  @override
  Future<BookingEntity> createBooking(BookingEntity booking) async {
    bookings = [...bookings, booking];
    return booking;
  }

  @override
  Future<BookingEntity> updateBooking(BookingEntity booking) async {
    bookings = bookings
        .map((item) => item.id == booking.id ? booking : item)
        .toList();

    return booking;
  }

  @override
  Future<void> deleteBooking(String id) async {
    bookings = bookings.where((booking) => booking.id != id).toList();
  }
}

CustomerEntity createCustomer() {
  return CustomerEntity(
    id: 'customer-001',
    customerCode: 'CUS-0001',
    fullName: 'Ahmad Fauzan',
    nickName: 'Ahmad',
    gender: 'male',
    birthPlace: 'Jakarta',
    birthDate: DateTime(1975, 5, 10),
    phoneNumber: '081234567890',
    email: 'ahmad@example.com',
    address: 'Jakarta',
    city: 'Jakarta',
    province: 'DKI Jakarta',
    country: 'Indonesia',
    occupation: 'Pengusaha',
    maritalStatus: 'married',
    leadSource: LeadSource.whatsapp,
    notes: null,
    isActive: true,
    createdAt: DateTime(2026, 8, 20),
    updatedAt: DateTime(2026, 8, 20),
    createdBy: 'user-001',
    updatedBy: null,
  );
}

PackageEntity createPackage() {
  return PackageEntity(
    id: 'package-001',
    packageCode: 'UMR-001',
    packageName: 'Umroh Reguler September',
    packageType: 'umroh',
    destinationCountry: 'Saudi Arabia',
    destinations: const ['Makkah', 'Madinah'],
    duration: 9,
    departureDate: DateTime(2026, 9, 15),
    returnDate: DateTime(2026, 9, 24),
    price: 35000000,
    currency: 'IDR',
    quota: 45,
    availableSeat: 20,
    isActive: true,
    notes: null,
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 8, 20),
    createdBy: 'user-001',
    updatedBy: null,
  );
}

PaymentEntity createPayment({double paidAmount = 10000000}) {
  return PaymentEntity(
    id: 'payment-001',
    paymentCode: 'PAY-0001',
    totalAmount: 35000000,
    paidAmount: paidAmount,
    remainingAmount: 35000000 - paidAmount,
    currency: 'IDR',
    paymentStatus: 'partial',
    dueDate: DateTime(2026, 9, 1),
    paidAt: DateTime(2026, 8, 20),
    notes: null,
    isActive: true,
    createdAt: DateTime(2026, 8, 20),
    updatedAt: DateTime(2026, 8, 20),
    createdBy: 'user-001',
    updatedBy: null,
  );
}

BookingEntity createBooking({
  String id = 'booking-001',
  String bookingCode = 'BK-2026-0001',
  double paidAmount = 10000000,
}) {
  return BookingEntity(
    id: id,
    bookingCode: bookingCode,
    bookingDate: DateTime(2026, 8, 20),
    departureDate: DateTime(2026, 9, 15),
    customer: createCustomer(),
    package: createPackage(),
    payment: createPayment(paidAmount: paidAmount),
    leadSource: LeadSource.whatsapp,
    status: domain_booking.BookingStatus.pending,
    createdAt: DateTime(2026, 8, 20),
    updatedAt: DateTime(2026, 8, 20),
  );
}

BookingController createController(FakeBookingRepository repository) {
  return BookingController(
    getBookingsUseCase: GetBookingsUseCase(repository: repository),
    getBookingByIdUseCase: GetBookingByIdUseCase(repository: repository),
    createBookingUseCase: CreateBookingUseCase(repository: repository),
    updateBookingUseCase: UpdateBookingUseCase(repository: repository),
    deleteBookingUseCase: DeleteBookingUseCase(repository: repository),
  );
}

void main() {
  group('BookingController', () {
    group('loadBookings', () {
      test('sets loading then success when bookings exist', () async {
        final repository = FakeBookingRepository()
          ..bookings = [createBooking()];

        final controller = createController(repository);

        expect(controller.state.status, BookingStatus.initial);

        final future = controller.loadBookings();

        expect(controller.state.status, BookingStatus.loading);

        await future;

        expect(controller.state.status, BookingStatus.success);
        expect(controller.state.bookings, hasLength(1));
        expect(controller.state.bookings.first.id, 'booking-001');
        expect(controller.state.errorMessage, isNull);
      });

      test('sets empty when repository returns no bookings', () async {
        final repository = FakeBookingRepository();
        final controller = createController(repository);

        await controller.loadBookings();

        expect(controller.state.status, BookingStatus.empty);
        expect(controller.state.bookings, isEmpty);
        expect(controller.state.errorMessage, isNull);
      });

      test('sets failure when repository throws', () async {
        final repository = FakeBookingRepository()
          ..getBookingsError = Exception('Unable to load bookings');

        final controller = createController(repository);

        await controller.loadBookings();

        expect(controller.state.status, BookingStatus.failure);
        expect(controller.state.hasError, isTrue);
        expect(
          controller.state.errorMessage,
          contains('Unable to load bookings'),
        );
      });
    });

    group('initialize', () {
      test('loads bookings', () async {
        final repository = FakeBookingRepository()
          ..bookings = [createBooking()];

        final controller = createController(repository);

        await controller.initialize();

        expect(controller.state.status, BookingStatus.success);
        expect(controller.state.bookings, hasLength(1));
      });
    });

    group('refresh', () {
      test('reloads bookings', () async {
        final repository = FakeBookingRepository()
          ..bookings = [createBooking()];

        final controller = createController(repository);

        await controller.refresh();

        expect(controller.state.status, BookingStatus.success);
        expect(controller.state.bookings, hasLength(1));
      });
    });

    group('getBookingById', () {
      test('returns and selects booking when booking exists', () async {
        final repository = FakeBookingRepository()
          ..bookings = [createBooking()];

        final controller = createController(repository);

        final result = await controller.getBookingById('booking-001');

        expect(result, isNotNull);
        expect(result!.id, 'booking-001');
        expect(controller.state.selectedBooking, isNotNull);
        expect(controller.state.selectedBooking!.id, 'booking-001');
        expect(controller.state.errorMessage, isNull);
      });

      test('returns null when booking does not exist', () async {
        final repository = FakeBookingRepository();
        final controller = createController(repository);

        final result = await controller.getBookingById('booking-404');

        expect(result, isNull);
        expect(controller.state.selectedBooking, isNull);
      });
    });

    group('createBooking', () {
      test('creates booking and reloads state', () async {
        final repository = FakeBookingRepository();
        final controller = createController(repository);

        final booking = createBooking();

        await controller.createBooking(booking);

        expect(repository.bookings, hasLength(1));
        expect(repository.bookings.first.id, 'booking-001');
        expect(controller.state.status, BookingStatus.success);
        expect(controller.state.bookings, hasLength(1));
      });
    });

    group('updateBooking', () {
      test('updates booking and reloads state', () async {
        final original = createBooking();

        final repository = FakeBookingRepository()..bookings = [original];

        final controller = createController(repository);

        final updated = createBooking(
          id: original.id,
          bookingCode: 'BK-2026-UPDATED',
          paidAmount: 20000000,
        );

        await controller.updateBooking(updated);

        expect(repository.bookings, hasLength(1));
        expect(repository.bookings.first.bookingCode, 'BK-2026-UPDATED');
        expect(repository.bookings.first.payment.paidAmount, 20000000);
        expect(controller.state.status, BookingStatus.success);
        expect(controller.state.bookings.first.bookingCode, 'BK-2026-UPDATED');
      });
    });

    group('deleteBooking', () {
      test('deletes booking and reloads empty state', () async {
        final repository = FakeBookingRepository()
          ..bookings = [createBooking()];

        final controller = createController(repository);

        await controller.deleteBooking('booking-001');

        expect(repository.bookings, isEmpty);
        expect(controller.state.status, BookingStatus.empty);
        expect(controller.state.bookings, isEmpty);
      });
    });
  });
}
