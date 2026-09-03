import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/features/booking/application/providers/booking_provider.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';

class BookingDetailPage extends ConsumerStatefulWidget {
  final String bookingId;

  const BookingDetailPage({super.key, required this.bookingId});

  @override
  ConsumerState<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends ConsumerState<BookingDetailPage> {
  BookingEntity? _booking;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadBooking);
  }

  Future<void> _loadBooking() async {
    final controller = ref.read(bookingControllerProvider);

    try {
      final booking = await controller.getBookingById(widget.bookingId);

      if (!mounted) {
        return;
      }

      setState(() {
        _booking = booking;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _booking = null;
        _isLoading = false;
        _errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Detail')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return _MessageState(
        message: 'Gagal memuat booking.',
        detail: _errorMessage,
        onRetry: _loadBooking,
      );
    }

    final booking = _booking;

    if (booking == null) {
      return const _MessageState(message: 'Booking tidak ditemukan.');
    }

    return RefreshIndicator(
      onRefresh: _loadBooking,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _BookingHeader(booking: booking),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Booking Information',
            children: [
              _InfoRow(label: 'Booking Code', value: booking.bookingCode),
              _InfoRow(
                label: 'Booking Date',
                value: _formatDate(booking.bookingDate),
              ),
              _InfoRow(
                label: 'Departure',
                value: _formatDate(booking.departureDate),
              ),
              _InfoRow(label: 'Lead Source', value: booking.leadSource.name),
            ],
          ),
          const SizedBox(height: 16),
          _CustomerSection(booking: booking),
          const SizedBox(height: 16),
          _PackageSection(booking: booking),
          const SizedBox(height: 16),
          _PaymentSection(booking: booking),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Audit',
            children: [
              _InfoRow(
                label: 'Created',
                value: _formatDateTime(booking.createdAt),
              ),
              _InfoRow(
                label: 'Updated',
                value: _formatDateTime(booking.updatedAt),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BookingHeader extends StatelessWidget {
  final BookingEntity booking;

  const _BookingHeader({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.bookingCode,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Chip(label: Text(booking.status.name.toUpperCase())),
          ],
        ),
      ),
    );
  }
}

class _CustomerSection extends StatelessWidget {
  final BookingEntity booking;

  const _CustomerSection({required this.booking});

  @override
  Widget build(BuildContext context) {
    final customer = booking.customer;

    return _SectionCard(
      title: 'Customer',
      children: [
        _InfoRow(label: 'Customer Code', value: customer.customerCode),
        _InfoRow(label: 'Full Name', value: customer.fullName),
        if (customer.nickName != null)
          _InfoRow(label: 'Nick Name', value: customer.nickName!),
        _InfoRow(label: 'Gender', value: customer.gender),
        _InfoRow(label: 'Phone', value: customer.phoneNumber),
        if (customer.email != null)
          _InfoRow(label: 'Email', value: customer.email!),
        if (customer.address != null)
          _InfoRow(label: 'Address', value: customer.address!),
        if (customer.city != null)
          _InfoRow(label: 'City', value: customer.city!),
        if (customer.province != null)
          _InfoRow(label: 'Province', value: customer.province!),
        _InfoRow(label: 'Country', value: customer.country),
        if (customer.occupation != null)
          _InfoRow(label: 'Occupation', value: customer.occupation!),
        if (customer.maritalStatus != null)
          _InfoRow(label: 'Marital Status', value: customer.maritalStatus!),
      ],
    );
  }
}

class _PackageSection extends StatelessWidget {
  final BookingEntity booking;

  const _PackageSection({required this.booking});

  @override
  Widget build(BuildContext context) {
    final package = booking.package;

    return _SectionCard(
      title: 'Package',
      children: [
        _InfoRow(label: 'Package Code', value: package.packageCode),
        _InfoRow(label: 'Package Name', value: package.packageName),
        _InfoRow(label: 'Package Type', value: package.packageType),
        _InfoRow(
          label: 'Destination Country',
          value: package.destinationCountry,
        ),
        _InfoRow(label: 'Destinations', value: package.destinations.join(', ')),
        _InfoRow(label: 'Duration', value: '${package.duration} days'),
        _InfoRow(label: 'Departure', value: _formatDate(package.departureDate)),
        _InfoRow(label: 'Return', value: _formatDate(package.returnDate)),
        _InfoRow(
          label: 'Price',
          value: '${package.currency} ${package.price.toStringAsFixed(2)}',
        ),
        _InfoRow(label: 'Quota', value: package.quota.toString()),
        _InfoRow(
          label: 'Available Seat',
          value: package.availableSeat.toString(),
        ),
        _InfoRow(label: 'Active', value: package.isActive ? 'Yes' : 'No'),
        if (package.notes != null)
          _InfoRow(label: 'Notes', value: package.notes!),
      ],
    );
  }
}

class _PaymentSection extends StatelessWidget {
  final BookingEntity booking;

  const _PaymentSection({required this.booking});

  @override
  Widget build(BuildContext context) {
    final payment = booking.payment;

    return _SectionCard(
      title: 'Payment',
      children: [
        _InfoRow(label: 'Payment Code', value: payment.paymentCode),
        _InfoRow(
          label: 'Total Amount',
          value:
              '${payment.currency} ${payment.totalAmount.toStringAsFixed(2)}',
        ),
        _InfoRow(
          label: 'Paid Amount',
          value: '${payment.currency} ${payment.paidAmount.toStringAsFixed(2)}',
        ),
        _InfoRow(
          label: 'Remaining',
          value:
              '${payment.currency} ${payment.remainingAmount.toStringAsFixed(2)}',
        ),
        _InfoRow(label: 'Status', value: payment.paymentStatus),
        if (payment.dueDate != null)
          _InfoRow(label: 'Due Date', value: _formatDate(payment.dueDate!)),
        if (payment.paidAt != null)
          _InfoRow(label: 'Paid At', value: _formatDateTime(payment.paidAt!)),
        if (payment.notes != null)
          _InfoRow(label: 'Notes', value: payment.notes!),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _MessageState extends StatelessWidget {
  final String message;
  final String? detail;
  final VoidCallback? onRetry;

  const _MessageState({required this.message, this.detail, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (detail != null) ...[
              const SizedBox(height: 8),
              Text(detail!, textAlign: TextAlign.center),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Coba Lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime value) {
  return '${value.day.toString().padLeft(2, '0')}/'
      '${value.month.toString().padLeft(2, '0')}/'
      '${value.year}';
}

String _formatDateTime(DateTime value) {
  return '${_formatDate(value)} '
      '${value.hour.toString().padLeft(2, '0')}:'
      '${value.minute.toString().padLeft(2, '0')}';
}
