import 'package:dashboard_kpi/core/common/base/base_entity.dart';

class DocumentEntity extends BaseEntity {
  final String documentNumber;
  final DateTime? issuedDate;
  final DateTime? expiredDate;

  const DocumentEntity({
    required super.id,
    required this.documentNumber,
    this.issuedDate,
    this.expiredDate,
  });
}
