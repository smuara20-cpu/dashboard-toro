import 'package:flutter/material.dart';

class CashflowCard extends StatelessWidget {
  const CashflowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Cashflow",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(title: Text("Pemasukan"), trailing: Text("Rp 2,35 M")),
            ListTile(title: Text("Pengeluaran"), trailing: Text("Rp 845 Jt")),
            ListTile(title: Text("Saldo"), trailing: Text("Rp 1,50 M")),
          ],
        ),
      ),
    );
  }
}
