import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/customer/presentation/dialogs/customer_selector_dialog.dart';

void main() {
  group('CustomerSelectorDialog', () {
    testWidgets(
      'menampilkan customer aktif dan mengembalikan customer yang dipilih',
      (tester) async {
        CustomerEntity? selectedCustomer;

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Builder(
                builder: (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () async {
                      selectedCustomer = await showDialog<CustomerEntity>(
                        context: context,
                        builder: (_) => const CustomerSelectorDialog(),
                      );
                    },
                    child: const Text('Open'),
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        expect(find.text('Pilih Customer'), findsOneWidget);
        expect(find.text('Ahmad Fauzan'), findsOneWidget);
        expect(find.textContaining('CUS-0001'), findsOneWidget);
        expect(find.textContaining('081234567890'), findsOneWidget);

        await tester.tap(find.text('Ahmad Fauzan'));
        await tester.pumpAndSettle();

        expect(selectedCustomer, isNotNull);
        expect(selectedCustomer!.id, 'customer-001');
        expect(selectedCustomer!.customerCode, 'CUS-0001');
        expect(selectedCustomer!.fullName, 'Ahmad Fauzan');
      },
    );

    testWidgets('tombol Batal menutup dialog tanpa memilih customer', (
      tester,
    ) async {
      CustomerEntity? selectedCustomer;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Builder(
              builder: (context) => Scaffold(
                body: ElevatedButton(
                  onPressed: () async {
                    selectedCustomer = await showDialog<CustomerEntity>(
                      context: context,
                      builder: (_) => const CustomerSelectorDialog(),
                    );
                  },
                  child: const Text('Open'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Pilih Customer'), findsOneWidget);

      await tester.tap(find.text('Batal'));
      await tester.pumpAndSettle();

      expect(find.text('Pilih Customer'), findsNothing);
      expect(selectedCustomer, isNull);
    });
  });
}
