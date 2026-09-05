import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/presentation/dialogs/package_selector_dialog.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/customer/presentation/dialogs/customer_selector_dialog.dart';

class CreateBookingPage extends StatefulWidget {
  const CreateBookingPage({super.key});

  @override
  State<CreateBookingPage> createState() => _CreateBookingPageState();
}

class _CreateBookingPageState extends State<CreateBookingPage> {
  CustomerEntity? _selectedCustomer;
  PackageEntity? _selectedPackage;

  bool _customerError = false;
  bool _packageError = false;

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

  void _continue() {
    final customerMissing = _selectedCustomer == null;
    final packageMissing = _selectedPackage == null;

    if (customerMissing || packageMissing) {
      setState(() {
        _customerError = customerMissing;
        _packageError = packageMissing;
      });
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Customer dan package berhasil dipilih.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
