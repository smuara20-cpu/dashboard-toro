import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/presentation/dialogs/package_selector_dialog.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/customer/presentation/dialogs/customer_selector_dialog.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';

class CreateBookingPage extends StatefulWidget {
  const CreateBookingPage({super.key});

  @override
  State<CreateBookingPage> createState() => _CreateBookingPageState();
}

class _CreateBookingPageState extends State<CreateBookingPage> {
  CustomerEntity? _selectedCustomer;
  PackageEntity? _selectedPackage;

  DateTime _bookingDate = DateTime.now();
  LeadSource? _selectedLeadSource;

  bool _customerError = false;
  bool _packageError = false;
  bool _leadSourceError = false;

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

  void _continue() {
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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking information berhasil dilengkapi.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final showBookingInformation =
        _selectedCustomer != null && _selectedPackage != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Baru'),
        leading: IconButton(
          tooltip: 'Kembali',
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              'Buat Booking',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Lengkapi data booking secara bertahap.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _SectionCard(
              title: 'Customer',
              required: true,
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
              required: true,
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
            if (showBookingInformation) ...[
              const SizedBox(height: AppSpacing.lg),
              _BookingInformationSection(
                bookingDate: _bookingDate,
                selectedLeadSource: _selectedLeadSource,
                leadSourceError: _leadSourceError,
                departureDate: _selectedPackage!.departureDate,
                onSelectBookingDate: _selectBookingDate,
                onSelectLeadSource: _selectLeadSource,
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: _continue,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Lanjut'),
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
  final bool required;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.child,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (required)
                  Text(
                    ' *',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.danger,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer belum dipilih.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: onSelect,
          icon: const Icon(Icons.person_search_outlined),
          label: const Text('Pilih Customer'),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Customer wajib dipilih.',
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.danger),
          ),
        ],
      ],
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
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.person_outline)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.fullName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${customer.customerCode} • ${customer.phoneNumber}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Package belum dipilih.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: onSelect,
          icon: const Icon(Icons.inventory_2_outlined),
          label: const Text('Pilih Package'),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Package wajib dipilih.',
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.danger),
          ),
        ],
      ],
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
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.inventory_2_outlined)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  package.packageName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${package.packageCode} • '
                  '${_formatDate(package.departureDate)} - '
                  '${_formatDate(package.returnDate)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${package.duration} Hari • '
                  'Sisa seat: ${package.availableSeat}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _formatCurrency(package.price, package.currency),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
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
  final DateTime departureDate;
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
    return _SectionCard(
      title: 'Booking Information',
      required: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal Booking',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          OutlinedButton.icon(
            onPressed: onSelectBookingDate,
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text(_formatDate(bookingDate)),
          ),
          const SizedBox(height: AppSpacing.lg),
          DropdownButtonFormField<LeadSource>(
            initialValue: selectedLeadSource,
            decoration: InputDecoration(
              labelText: 'Sumber Lead',
              border: const OutlineInputBorder(),
              errorText: leadSourceError ? 'Sumber lead wajib dipilih.' : null,
            ),
            items: LeadSource.values
                .map(
                  (source) => DropdownMenuItem<LeadSource>(
                    value: source,
                    child: Text(_leadSourceLabel(source)),
                  ),
                )
                .toList(),
            onChanged: onSelectLeadSource,
          ),
          const SizedBox(height: AppSpacing.lg),
          _DerivedInformationCard(
            label: 'Departure Date',
            value: _formatDate(departureDate),
            icon: Icons.flight_takeoff_outlined,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  String _leadSourceLabel(LeadSource source) {
    switch (source) {
      case LeadSource.whatsapp:
        return 'WhatsApp';
      case LeadSource.instagram:
        return 'Instagram';
      case LeadSource.facebook:
        return 'Facebook';
      case LeadSource.google:
        return 'Google';
      case LeadSource.tiktok:
        return 'TikTok';
      case LeadSource.website:
        return 'Website';
      case LeadSource.referral:
        return 'Referral';
      case LeadSource.walkIn:
        return 'Walk-in';
      case LeadSource.other:
        return 'Lainnya';
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
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.textSecondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  value,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Otomatis mengikuti tanggal keberangkatan package.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
