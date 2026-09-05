import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/features/booking/application/providers/booking_provider.dart';
import 'package:dashboard_kpi/features/booking/application/state/booking_state.dart'
    as booking_state;
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/presentation/dialogs/package_selector_dialog.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/customer/presentation/dialogs/customer_selector_dialog.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';

class CreateBookingPage extends ConsumerStatefulWidget {
  const CreateBookingPage({super.key});

  @override
  ConsumerState<CreateBookingPage> createState() => _CreateBookingPageState();
}

class _CreateBookingPageState extends ConsumerState<CreateBookingPage> {
  CustomerEntity? _selectedCustomer;
  PackageEntity? _selectedPackage;

  DateTime _bookingDate = DateTime.now();
  LeadSource? _selectedLeadSource;

  bool _customerError = false;
  bool _packageError = false;
  bool _leadSourceError = false;
  bool _isSubmitting = false;

  Future<void> _selectCustomer() async {
    final customer = await showDialog<CustomerEntity>(
      context: context,
      builder: (_) => const CustomerSelectorDialog(),
    );

    if (!mounted || customer == null) {
      return;
    }

    setState(() {
      _selectedCustomer = customer;
      _customerError = false;
    });
  }

  Future<void> _selectPackage() async {
    final package = await showDialog<PackageEntity>(
      context: context,
      builder: (_) => const PackageSelectorDialog(),
    );

    if (!mounted || package == null) {
      return;
    }

    setState(() {
      _selectedPackage = package;
      _packageError = false;
    });
  }

  Future<void> _selectBookingDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _bookingDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      helpText: 'Pilih Tanggal Booking',
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );

    if (!mounted || selectedDate == null) {
      return;
    }

    setState(() {
      _bookingDate = selectedDate;
    });
  }

  void _selectLeadSource(LeadSource? source) {
    setState(() {
      _selectedLeadSource = source;
      _leadSourceError = false;
    });
  }

  Future<void> _createBooking() async {
    final customerMissing = _selectedCustomer == null;
    final packageMissing = _selectedPackage == null;
    final leadSourceMissing = _selectedLeadSource == null;

    if (customerMissing || packageMissing || leadSourceMissing) {
      setState(() {
        _customerError = customerMissing;
        _packageError = packageMissing;
        _leadSourceError = leadSourceMissing;
      });
      return;
    }

    if (_isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final factory = ref.read(bookingCreationFactoryProvider);
      final controller = ref.read(bookingControllerProvider);

      final booking = factory.create(
        customer: _selectedCustomer!,
        package: _selectedPackage!,
        bookingDate: _bookingDate,
        leadSource: _selectedLeadSource!,
      );

      await controller.createBooking(booking);

      if (!mounted) {
        return;
      }

      if (controller.state.status == booking_state.BookingStatus.failure) {
        final message =
            controller.state.errorMessage ?? 'Booking gagal dibuat.';

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));

        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Booking berhasil dibuat.')));

      context.pop(true);
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Booking gagal dibuat: $error')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _cancel() {
    if (_isSubmitting) {
      return;
    }

    context.pop(false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Booking'),
        leading: IconButton(
          tooltip: 'Kembali',
          onPressed: _isSubmitting ? null : () => context.pop(false),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Buat Booking Baru',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Lengkapi informasi booking sebelum menyimpan data.',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        _SectionCard(
                          title: 'Customer',
                          subtitle:
                              'Pilih customer aktif yang akan melakukan booking.',
                          child: _selectedCustomer == null
                              ? _CustomerEmptyState(
                                  hasError: _customerError,
                                  onSelect: _selectCustomer,
                                )
                              : _SelectedCustomerCard(
                                  customer: _selectedCustomer!,
                                  onChange: _selectCustomer,
                                ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        _SectionCard(
                          title: 'Package',
                          subtitle:
                              'Pilih package aktif yang masih memiliki seat.',
                          child: _selectedPackage == null
                              ? _PackageEmptyState(
                                  hasError: _packageError,
                                  onSelect: _selectPackage,
                                )
                              : _SelectedPackageCard(
                                  package: _selectedPackage!,
                                  onChange: _selectPackage,
                                ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        _SectionCard(
                          title: 'Booking Information',
                          subtitle: 'Tentukan tanggal booking dan sumber lead.',
                          child: _BookingInformationSection(
                            bookingDate: _bookingDate,
                            selectedLeadSource: _selectedLeadSource,
                            leadSourceError: _leadSourceError,
                            departureDate: _selectedPackage?.departureDate,
                            onSelectBookingDate: _selectBookingDate,
                            onSelectLeadSource: _selectLeadSource,
                          ),
                        ),
                        if (_selectedCustomer != null &&
                            _selectedPackage != null &&
                            _selectedLeadSource != null) ...[
                          const SizedBox(height: AppSpacing.lg),
                          _PaymentInformationSection(
                            package: _selectedPackage!,
                          ),
                        ],
                        const SizedBox(height: AppSpacing.xl),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border(top: BorderSide(color: theme.dividerColor)),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _isSubmitting ? null : _cancel,
                        child: const Text('Batal'),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      FilledButton.icon(
                        onPressed: _isSubmitting ? null : _createBooking,
                        icon: _isSubmitting
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.check),
                        label: Text(
                          _isSubmitting ? 'Menyimpan...' : 'Create Booking',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(subtitle, style: theme.textTheme.bodySmall),
            const SizedBox(height: AppSpacing.lg),
            child,
          ],
        ),
      ),
    );
  }
}

class _CustomerEmptyState extends StatelessWidget {
  final bool hasError;
  final VoidCallback onSelect;

  const _CustomerEmptyState({required this.hasError, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border.all(
          color: hasError ? theme.colorScheme.error : theme.dividerColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.person_outline,
            size: 36,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Belum ada customer dipilih.',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Pilih customer aktif untuk melanjutkan booking.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: onSelect,
            icon: const Icon(Icons.person_search),
            label: const Text('Pilih Customer'),
          ),
          if (hasError) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Customer wajib dipilih.',
              style: TextStyle(color: theme.colorScheme.error, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}

class _SelectedCustomerCard extends StatelessWidget {
  final CustomerEntity customer;
  final VoidCallback onChange;

  const _SelectedCustomerCard({required this.customer, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            child: Text(
              customer.fullName.isEmpty
                  ? '?'
                  : customer.fullName.trim().substring(0, 1).toUpperCase(),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.fullName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${customer.customerCode} • ${customer.phoneNumber}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          TextButton(onPressed: onChange, child: const Text('Ubah')),
        ],
      ),
    );
  }
}

class _PackageEmptyState extends StatelessWidget {
  final bool hasError;
  final VoidCallback onSelect;

  const _PackageEmptyState({required this.hasError, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border.all(
          color: hasError ? theme.colorScheme.error : theme.dividerColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.card_travel_outlined,
            size: 36,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Belum ada package dipilih.',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Pilih package aktif yang masih memiliki seat.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: onSelect,
            icon: const Icon(Icons.search),
            label: const Text('Pilih Package'),
          ),
          if (hasError) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Package wajib dipilih.',
              style: TextStyle(color: theme.colorScheme.error, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}

class _SelectedPackageCard extends StatelessWidget {
  final PackageEntity package;
  final VoidCallback onChange;

  const _SelectedPackageCard({required this.package, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.card_travel, size: 32, color: theme.colorScheme.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  package.packageName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${package.packageCode} • '
                  '${package.availableSeat} seat tersedia',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${_formatDate(package.departureDate)} - '
                  '${_formatDate(package.returnDate)}',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${package.duration} hari • '
                  '${_formatCurrency(package.price, package.currency)}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          TextButton(onPressed: onChange, child: const Text('Ubah')),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  String _formatCurrency(double amount, String currency) {
    final value = amount.toStringAsFixed(0);

    final formatted = value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );

    return '$currency $formatted';
  }
}

class _BookingInformationSection extends StatelessWidget {
  final DateTime bookingDate;
  final LeadSource? selectedLeadSource;
  final bool leadSourceError;
  final DateTime? departureDate;
  final VoidCallback onSelectBookingDate;
  final ValueChanged<LeadSource?> onSelectLeadSource;

  const _BookingInformationSection({
    required this.bookingDate,
    required this.selectedLeadSource,
    required this.leadSourceError,
    required this.departureDate,
    required this.onSelectBookingDate,
    required this.onSelectLeadSource,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onSelectBookingDate,
          borderRadius: BorderRadius.circular(12),
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Tanggal Booking',
              prefixIcon: Icon(Icons.calendar_today_outlined),
            ),
            child: Text(_formatDate(bookingDate)),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        DropdownButtonFormField<LeadSource>(
          initialValue: selectedLeadSource,
          decoration: InputDecoration(
            labelText: 'Lead Source',
            prefixIcon: const Icon(Icons.source_outlined),
            errorText: leadSourceError ? 'Lead Source wajib dipilih.' : null,
          ),
          items: LeadSource.values.map((source) {
            return DropdownMenuItem<LeadSource>(
              value: source,
              child: Text(_leadSourceLabel(source)),
            );
          }).toList(),
          onChanged: onSelectLeadSource,
        ),
        if (departureDate != null) ...[
          const SizedBox(height: AppSpacing.md),
          _DerivedInformationCard(
            label: 'Departure Date',
            value: _formatDate(departureDate!),
            icon: Icons.flight_takeoff_outlined,
          ),
        ],
      ],
    );
  }

  String _formatDate(DateTime value) {
    return '${value.day.toString().padLeft(2, '0')}/'
        '${value.month.toString().padLeft(2, '0')}/'
        '${value.year}';
  }

  String _leadSourceLabel(LeadSource source) {
    switch (source) {
      case LeadSource.whatsapp:
        return 'WhatsApp';
      case LeadSource.instagram:
        return 'Instagram';
      case LeadSource.facebook:
        return 'Facebook';
      case LeadSource.website:
        return 'Website';
      case LeadSource.referral:
        return 'Referral';
      case LeadSource.walkIn:
        return 'Walk In';
      case LeadSource.google:
        return 'Google';
      case LeadSource.tiktok:
        return 'TikTok';
      case LeadSource.other:
        return 'Other';
    }
  }
}

class _DerivedInformationCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DerivedInformationCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentInformationSection extends StatelessWidget {
  final PackageEntity package;

  const _PaymentInformationSection({required this.package});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final totalAmount = package.price;
    const paidAmount = 0.0;
    final remainingAmount = totalAmount - paidAmount;

    return _SectionCard(
      title: 'Payment Information',
      subtitle: 'Informasi pembayaran dibuat otomatis dari package.',
      child: Column(
        children: [
          _PaymentRow(
            label: 'Total',
            value: _formatAmount(package.currency, totalAmount),
          ),
          const SizedBox(height: AppSpacing.md),
          _PaymentRow(
            label: 'Paid',
            value: _formatAmount(package.currency, paidAmount),
          ),
          const SizedBox(height: AppSpacing.md),
          _PaymentRow(
            label: 'Remaining',
            value: _formatAmount(package.currency, remainingAmount),
            isEmphasized: true,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text('Status', style: theme.textTheme.bodyMedium),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Unpaid',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatAmount(String currency, double amount) {
    final value = amount.toStringAsFixed(0);

    final formatted = value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );

    return '$currency $formatted';
  }
}

class _PaymentRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isEmphasized;

  const _PaymentRow({
    required this.label,
    required this.value,
    this.isEmphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isEmphasized ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
