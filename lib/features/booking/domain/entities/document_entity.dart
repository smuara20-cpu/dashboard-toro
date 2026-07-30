import '../../../../core/base/base_entity.dart';

class DocumentEntity extends BaseEntity {
  @override
  final String id;

  final String documentNumber;
  final DateTime? issuedDate;
  final DateTime? expiredDate;

  const DocumentEntity({
    required this.id,
    required this.documentNumber,
    this.issuedDate,
    this.expiredDate,
  });
}