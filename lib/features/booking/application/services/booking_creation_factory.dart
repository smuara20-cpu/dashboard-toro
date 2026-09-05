import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/package_entity.dart';
import '../../domain/entities/payment_entity.dart';
import '../../domain/enums/booking_status.dart';
import '../../../crm/domain/enums/lead_source.dart';
import '../../../customer/domain/entities/customer_entity.dart';

class BookingCreationFactory {
  const BookingCreationFactory();

  BookingEntity create({
    required CustomerEntity customer,
    required PackageEntity package,
    required DateTime bookingDate,
    required LeadSource leadSource,
    DateTime? now,
  }) {
    final createdAt = now ?? DateTime.now();
    final stamp = _formatStamp(createdAt);

    final bookingId = 'booking-${createdAt.microsecondsSinceEpoch}';
    final bookingCode = 'BK-$stamp';

    final paymentId = 'payment-${createdAt.microsecondsSinceEpoch}';
    final paymentCode = 'PAY-$stamp';

    final totalAmount = package.price;
    const paidAmount = 0.0;
    final remainingAmount = totalAmount - paidAmount;

    final payment = PaymentEntity(
      id: paymentId,
      paymentCode: paymentCode,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      currency: package.currency,
      paymentStatus: 'unpaid',
      dueDate: null,
      paidAt: null,
      notes: null,
      isActive: true,
      createdAt: createdAt,
      updatedAt: createdAt,
      createdBy: 'system',
      updatedBy: null,
    );

    return BookingEntity(
      id: bookingId,
      bookingCode: bookingCode,
      bookingDate: bookingDate,
      departureDate: package.departureDate,
      customer: customer,
      package: package,
      payment: payment,
      leadSource: leadSource,
      status: BookingStatus.pending,
      createdAt: createdAt,
      updatedAt: createdAt,
    );
  }

  String _formatStamp(DateTime value) {
    String twoDigits(int number) {
      return number.toString().padLeft(2, '0');
    }

    return '${value.year}'
        '${twoDigits(value.month)}'
        '${twoDigits(value.day)}-'
        '${twoDigits(value.hour)}'
        '${twoDigits(value.minute)}'
        '${twoDigits(value.second)}'
        '${value.millisecond.toString().padLeft(3, '0')}';
  }
}
