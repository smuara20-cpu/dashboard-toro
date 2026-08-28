import '../enums/transaction_type.dart';
import '../value_objects/money.dart';

class TransactionEntity {
  final String id;

  /// Unique transaction number/code.
  final String transactionCode;

  /// Transaction type.
  ///
  /// Example:
  /// income
  /// expense
  final TransactionType type;

  /// Financial amount.
  ///
  /// Uses Money value object to keep amount
  /// and currency together.
  final Money amount;

  /// Human-readable transaction description.
  final String description;

  /// Date when the transaction occurred.
  final DateTime transactionDate;

  /// Optional reference to another business object.
  ///
  /// Examples:
  /// booking ID
  /// invoice ID
  /// payment ID
  /// expense ID
  final String? referenceId;

  /// Optional reference type.
  ///
  /// Examples:
  /// booking
  /// invoice
  /// payment
  /// expense
  final String? referenceType;

  /// Optional branch identifier.
  final String? branchId;

  /// Optional customer identifier.
  final String? customerId;

  /// Optional package identifier.
  final String? packageId;

  /// Optional transaction notes.
  final String? notes;

  /// Record creation timestamp.
  final DateTime createdAt;

  /// User who created the transaction.
  final String createdBy;

  const TransactionEntity({
    required this.id,
    required this.transactionCode,
    required this.type,
    required this.amount,
    required this.description,
    required this.transactionDate,
    this.referenceId,
    this.referenceType,
    this.branchId,
    this.customerId,
    this.packageId,
    this.notes,
    required this.createdAt,
    required this.createdBy,
  });
}