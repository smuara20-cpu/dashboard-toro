import 'package:dashboard_kpi/core/common/base/base_mapper.dart';

import '../../domain/entities/package_entity.dart';
import '../models/package_model.dart';

class PackageMapper implements BaseMapper<PackageEntity, PackageModel> {
  const PackageMapper();

  @override
  PackageEntity toEntity(PackageModel model) {
    return PackageEntity(
      id: model.id,
      packageCode: model.packageCode,
      packageName: model.packageName,
      packageType: model.packageType,
      destinationCountry: model.destinationCountry,
      destinations: List<String>.unmodifiable(model.destinations),
      duration: model.duration,
      departureDate: model.departureDate,
      returnDate: model.returnDate,
      price: model.price,
      currency: model.currency,
      quota: model.quota,
      availableSeat: model.availableSeat,
      isActive: model.isActive,
      notes: model.notes,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      createdBy: model.createdBy,
      updatedBy: model.updatedBy,
    );
  }

  @override
  PackageModel toModel(PackageEntity entity) {
    return PackageModel(
      id: entity.id,
      packageCode: entity.packageCode,
      packageName: entity.packageName,
      packageType: entity.packageType,
      destinationCountry: entity.destinationCountry,
      destinations: List<String>.from(entity.destinations),
      duration: entity.duration,
      departureDate: entity.departureDate,
      returnDate: entity.returnDate,
      price: entity.price,
      currency: entity.currency,
      quota: entity.quota,
      availableSeat: entity.availableSeat,
      isActive: entity.isActive,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      createdBy: entity.createdBy,
      updatedBy: entity.updatedBy,
    );
  }
}
