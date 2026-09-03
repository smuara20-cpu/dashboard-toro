import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/dummy/booking_dummy.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/models/booking_model.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';

void main() {
  late BookingMapper mapper;
  late BookingModel sourceModel;

  setUp(() {
    mapper = BookingMapper();
    sourceModel = bookingDummy.first;
  });

  group('BookingMapper', () {
    test('toEntity maps BookingModel to BookingEntity correctly', () {
      final entity = mapper.toEntity(sourceModel);

      expect(entity, isA<BookingEntity>());

      expect(entity.id, sourceModel.id);
      expect(entity.bookingCode, sourceModel.bookingCode);
      expect(entity.bookingDate, sourceModel.bookingDate);
      expect(entity.departureDate, sourceModel.departureDate);

      expect(entity.customer.fullName, sourceModel.customer['fullName']);

      expect(entity.package.packageCode, sourceModel.package['packageCode']);

      expect(entity.package.packageName, sourceModel.package['packageName']);

      expect(entity.payment.totalAmount, sourceModel.payment['totalAmount']);

      expect(entity.payment.paidAmount, sourceModel.payment['paidAmount']);

      expect(
        entity.payment.remainingAmount,
        sourceModel.payment['remainingAmount'],
      );

      expect(entity.leadSource.name, sourceModel.leadSource);

      expect(entity.status.name, sourceModel.status);

      expect(entity.createdAt, sourceModel.createdAt);
      expect(entity.updatedAt, sourceModel.updatedAt);
    });

    test('toModel maps BookingEntity back to BookingModel correctly', () {
      final entity = mapper.toEntity(sourceModel);
      final model = mapper.toModel(entity);

      expect(model.id, sourceModel.id);
      expect(model.bookingCode, sourceModel.bookingCode);
      expect(model.bookingDate, sourceModel.bookingDate);
      expect(model.departureDate, sourceModel.departureDate);

      expect(model.customer['fullName'], sourceModel.customer['fullName']);
      expect(
        model.customer['phoneNumber'],
        sourceModel.customer['phoneNumber'],
      );

      expect(model.package['packageCode'], sourceModel.package['packageCode']);

      expect(model.package['packageName'], sourceModel.package['packageName']);

      expect(model.payment['totalAmount'], sourceModel.payment['totalAmount']);

      expect(model.payment['paidAmount'], sourceModel.payment['paidAmount']);

      expect(
        model.payment['remainingAmount'],
        sourceModel.payment['remainingAmount'],
      );

      expect(model.leadSource, sourceModel.leadSource);
      expect(model.status, sourceModel.status);
      expect(model.createdAt, sourceModel.createdAt);
      expect(model.updatedAt, sourceModel.updatedAt);
    });

    test('toEntity and toModel preserve booking identity', () {
      final entity = mapper.toEntity(sourceModel);
      final model = mapper.toModel(entity);

      expect(model.id, sourceModel.id);
      expect(model.bookingCode, sourceModel.bookingCode);
    });

    test('toEntity preserves enum values', () {
      final entity = mapper.toEntity(sourceModel);

      expect(entity.leadSource.name, sourceModel.leadSource);
      expect(entity.status.name, sourceModel.status);
    });

    test('toModel preserves enum values', () {
      final entity = mapper.toEntity(sourceModel);
      final model = mapper.toModel(entity);

      expect(model.leadSource, sourceModel.leadSource);
      expect(model.status, sourceModel.status);
    });
  });
}
