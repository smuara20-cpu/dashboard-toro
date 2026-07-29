import 'package:flutter/material.dart';

import '../../../../shared/buttons/primary_button.dart';
import '../../../../shared/buttons/base_button.dart';
import '../../../../core/theme/app_spacing.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ==========================
            /// BUTTON SECTION
            /// ==========================
            const Text(
              'Primary Button',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: AppSpacing.lg),

            PrimaryButton(text: 'Masuk', onPressed: () {}),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(
              text: 'Booking Sekarang',
              leadingIcon: Icons.flight_takeoff,
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(
              text: 'Lihat Paket',
              trailingIcon: Icons.arrow_forward_ios,
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(
              text: 'Chat WhatsApp',
              leadingIcon: Icons.chat,
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(text: 'Loading...', loading: true, onPressed: () {}),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(text: 'Disabled', enabled: false, onPressed: () {}),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(
              text: 'Ukuran Kecil',
              size: ButtonSize.small,
              fullWidth: false,
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.md),

            PrimaryButton(
              text: 'Ukuran Besar',
              size: ButtonSize.large,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
