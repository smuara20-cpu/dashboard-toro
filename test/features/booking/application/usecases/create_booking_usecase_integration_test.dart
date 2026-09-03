import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/create_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/payment_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/enums/booking_status.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';

void main() {
  late BookingRepository repository;
  late CreateBookingUseCase useCase;

  setUp(() {
    final dataSource = BookingLocalDataSource();
    final mapper = BookingMapper();

    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);

    useCase = CreateBookingUseCase(repository: repository);
  });

  test('creates booking and returns BookingEntity', () async {
    final now = DateTime(2026, 9, 3);

    final booking = BookingEntity(
      id: 'booking-integration-001',
      bookingCode: 'BK-2026-INT-001',
      bookingDate: now,
      departureDate: DateTime(2026, 10, 1),
      customer: CustomerEntity(
        id: 'customer-integration-001',
        customerCode: 'CUS-INT-001',
        fullName: 'Integration Customer',
        nickName: null,
        gender: 'male',
        birthPlace: null,
        birthDate: null,
        phoneNumber: '081234567890',
        email: null,
        address: null,
        city: null,
        province: null,
        country: 'Indonesia',
        occupation: null,
        maritalStatus: null,
        leadSource: null,
        notes: null,
        isActive: true,
        createdAt: now,
        updatedAt: now,
        createdBy: 'test',
        updatedBy: null,
      ),
      package: PackageEntity(
        id: 'package-integration-001',
        packageCode: 'PKG-INT-001',
        packageName: 'Integration Package',
        packageType: 'umroh',
        destinationCountry: 'Saudi Arabia',
        destinations: const ['Makkah', 'Madinah'],
        duration: 9,
        departureDate: DateTime(2026, 10, 1),
        returnDate: DateTime(2026, 10, 9),
        price: 25000000,
        currency: 'IDR',
        quota: 40,
        availableSeat: 39,
        isActive: true,
        notes: null,
        createdAt: now,
        updatedAt: now,
        createdBy: 'test',
        updatedBy: null,
      ),
      payment: PaymentEntity(
        id: 'payment-integration-001',
        paymentCode: 'PAY-INT-001',
        totalAmount: 25000000,
        paidAmount: 0,
        remainingAmount: 25000000,
        currency: 'IDR',
        paymentStatus: 'pending',
        dueDate: DateTime(2026, 9, 20),
        paidAt: null,
        notes: null,
        isActive: true,
        createdAt: now,
        updatedAt: now,
        createdBy: 'test',
        updatedBy: null,
      ),
      leadSource: LeadSource.website,
      status: BookingStatus.pending,
      createdAt: now,
      updatedAt: now,
    );

    final result = await useCase(booking);

    expect(result, isA<BookingEntity>());
    expect(result.id, 'booking-integration-001');
    expect(result.bookingCode, 'BK-2026-INT-001');
  });

  test(
    'created booking can be retrieved through the same repository flow',
    () async {
      final now = DateTime(2026, 9, 3);

      final booking = BookingEntity(
        id: 'booking-integration-002',
        bookingCode: 'BK-2026-INT-002',
        bookingDate: now,
        departureDate: DateTime(2026, 10, 5),
        customer: CustomerEntity(
          id: 'customer-integration-002',
          customerCode: 'CUS-INT-002',
          fullName: 'Integration Customer Two',
          nickName: null,
          gender: 'female',
          birthPlace: null,
          birthDate: null,
          phoneNumber: '081234567891',
          email: null,
          address: null,
          city: null,
          province: null,
          country: 'Indonesia',
          occupation: null,
          maritalStatus: null,
          leadSource: null,
          notes: null,
          isActive: true,
          createdAt: now,
          updatedAt: now,
          createdBy: 'test',
          updatedBy: null,
        ),
        package: PackageEntity(
          id: 'package-integration-002',
          packageCode: 'PKG-INT-002',
          packageName: 'Integration Package Two',
          packageType: 'umroh',
          destinationCountry: 'Saudi Arabia',
          destinations: const ['Makkah', 'Madinah'],
          duration: 10,
          departureDate: DateTime(2026, 10, 5),
          returnDate: DateTime(2026, 10, 14),
          price: 27000000,
          currency: 'IDR',
          quota: 40,
          availableSeat: 38,
          isActive: true,
          notes: null,
          createdAt: now,
          updatedAt: now,
          createdBy: 'test',
          updatedBy: null,
        ),
        payment: PaymentEntity(
          id: 'payment-integration-002',
          paymentCode: 'PAY-INT-002',
          totalAmount: 27000000,
          paidAmount: 0,
          remainingAmount: 27000000,
          currency: 'IDR',
          paymentStatus: 'pending',
          dueDate: DateTime(2026, 9, 25),
          paidAt: null,
          notes: null,
          isActive: true,
          createdAt: now,
          updatedAt: now,
          createdBy: 'test',
          updatedBy: null,
        ),
        leadSource: LeadSource.website,
        status: BookingStatus.pending,
        createdAt: now,
        updatedAt: now,
      );

      await useCase(booking);

      final retrieved = await repository.getBookingById(
        'booking-integration-002',
      );

      expect(retrieved, isNotNull);
      expect(retrieved!.bookingCode, 'BK-2026-INT-002');
    },
  );
}
