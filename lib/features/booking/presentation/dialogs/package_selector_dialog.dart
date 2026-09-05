import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/features/booking/application/providers/package_provider.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';

class PackageSelectorDialog extends ConsumerStatefulWidget {
  const PackageSelectorDialog({super.key});

  @override
  ConsumerState<PackageSelectorDialog> createState() =>
      _PackageSelectorDialogState();
}

class _PackageSelectorDialogState extends ConsumerState<PackageSelectorDialog> {
  @override
  Widget build(BuildContext context) {
    final useCase = ref.read(getAvailablePackagesUseCaseProvider);

    return AlertDialog(
      title: const Text('Pilih Package'),
      content: SizedBox(
        width: 560,
        child: FutureBuilder<List<PackageEntity>>(
          future: useCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 160,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return const SizedBox(
                height: 160,
                child: Center(child: Text('Gagal memuat package.')),
              );
            }

            final packages = snapshot.data ?? [];

            if (packages.isEmpty) {
              return const SizedBox(
                height: 160,
                child: Center(child: Text('Belum ada package yang tersedia.')),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              itemCount: packages.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final package = packages[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  title: Text(
                    package.packageName,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      '${package.packageCode} • '
                      '${_formatDate(package.departureDate)} - '
                      '${_formatDate(package.returnDate)}\n'
                      '${package.duration} Hari • '
                      'Sisa seat: ${package.availableSeat}\n'
                      '${_formatCurrency(package.price, package.currency)}',
                    ),
                  ),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.of(context).pop(package);
                  },
                );
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
      ],
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
