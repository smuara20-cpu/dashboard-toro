import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/datasource/package_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/package_mapper.dart';

void main() {
  group('PackageMapper', () {
    late PackageLocalDataSource dataSource;
    late PackageMapper mapper;

    setUp(() {
      dataSource = PackageLocalDataSource();
      mapper = const PackageMapper();
    });

    test('mengubah PackageModel menjadi PackageEntity', () async {
      final model = await dataSource.getPackageById('package-001');

      expect(model, isNotNull);

      final entity = mapper.toEntity(model!);

      expect(entity.id, 'package-001');
      expect(entity.packageCode, 'UMR-2026-001');
      expect(entity.packageName, 'Umroh Reguler Desember 2026');
      expect(entity.price, 32500000);
      expect(entity.currency, 'IDR');
      expect(entity.availableSeat, 12);
      expect(entity.isActive, isTrue);
    });

    test('round-trip entity dan model mempertahankan data utama', () async {
      final model = await dataSource.getPackageById('package-001');

      expect(model, isNotNull);

      final entity = mapper.toEntity(model!);
      final mappedModel = mapper.toModel(entity);

      expect(mappedModel.id, model.id);
      expect(mappedModel.packageCode, model.packageCode);
      expect(mappedModel.packageName, model.packageName);
      expect(mappedModel.destinations, model.destinations);
      expect(mappedModel.departureDate, model.departureDate);
      expect(mappedModel.returnDate, model.returnDate);
      expect(mappedModel.price, model.price);
      expect(mappedModel.currency, model.currency);
      expect(mappedModel.availableSeat, model.availableSeat);
      expect(mappedModel.isActive, model.isActive);
    });
  });
}
