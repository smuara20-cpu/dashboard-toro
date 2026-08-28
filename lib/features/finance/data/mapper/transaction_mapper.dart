import '../../../../core/common/base/base_mapper.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/enums/transaction_type.dart';
import '../../domain/value_objects/money.dart';
import '../models/transaction_model.dart';

class TransactionMapper
    implements BaseMapper<TransactionEntity, TransactionModel> {
  @override
  TransactionEntity toEntity(TransactionModel model) {
    return TransactionEntity(
      id: model.id,
      transactionCode: model.transactionCode,
      type: _toTransactionType(model.type),
      amount: Money(
        amountMinor: model.amountMinor,
        currency: model.currency,
      ),
      description: model.description,
      transactionDate: model.transactionDate,
      referenceId: model.referenceId,
      referenceType: model.referenceType,
      branchId: model.branchId,
      customerId: model.customerId,
      packageId: model.packageId,
      notes: model.notes,
      createdAt: model.createdAt,
      createdBy: model.createdBy,
    );
  }

  @override
  TransactionModel toModel(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      transactionCode: entity.transactionCode,
      type: entity.type.name,
      amountMinor: entity.amount.amountMinor,
      currency: entity.amount.currency,
      description: entity.description,
      transactionDate: entity.transactionDate,
      referenceId: entity.referenceId,
      referenceType: entity.referenceType,
      branchId: entity.branchId,
      customerId: entity.customerId,
      packageId: entity.packageId,
      notes: entity.notes,
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
    );
  }

  TransactionType _toTransactionType(String value) {
    return TransactionType.values.byName(value);
  }
}