import 'package:flutter/material.dart';

class RecentBookingTable extends StatelessWidget {
  const RecentBookingTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Booking Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            DataTable(
              columns: const [
                DataColumn(label: Text("Nama")),
                DataColumn(label: Text("Paket")),
                DataColumn(label: Text("Status")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("Ahmad")),
                    DataCell(Text("Umroh Agustus")),
                    DataCell(Text("DP")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("Fatimah")),
                    DataCell(Text("Japan Tour")),
                    DataCell(Text("Lunas")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("Rizki")),
                    DataCell(Text("Turkey")),
                    DataCell(Text("Booking")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
