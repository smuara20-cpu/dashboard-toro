import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/features/customer/application/providers/customer_provider.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';

class CustomerSelectorDialog extends ConsumerStatefulWidget {
  const CustomerSelectorDialog({super.key});

  @override
  ConsumerState<CustomerSelectorDialog> createState() =>
      _CustomerSelectorDialogState();
}

class _CustomerSelectorDialogState
    extends ConsumerState<CustomerSelectorDialog> {
  @override
  Widget build(BuildContext context) {
    final useCase = ref.read(getActiveCustomersUseCaseProvider);

    return AlertDialog(
      title: const Text('Pilih Customer'),
      content: SizedBox(
        width: 500,
        child: FutureBuilder<List<CustomerEntity>>(
          future: useCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return SizedBox(
                height: 120,
                child: Center(
                  child: Text(
                    'Gagal memuat customer.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            }

            final customers = snapshot.data ?? [];

            if (customers.isEmpty) {
              return const SizedBox(
                height: 120,
                child: Center(child: Text('Belum ada customer aktif.')),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              itemCount: customers.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final customer = customers[index];

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    customer.fullName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${customer.customerCode} • ${customer.phoneNumber}',
                  ),
                  onTap: () {
                    Navigator.of(context).pop(customer);
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
}
