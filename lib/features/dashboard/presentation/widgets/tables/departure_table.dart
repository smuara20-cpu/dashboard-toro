import 'package:flutter/material.dart';

class DepartureTable extends StatelessWidget {
  const DepartureTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Keberangkatan Mendatang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            DataTable(
              columns: const [
                DataColumn(label: Text("Tanggal")),
                DataColumn(label: Text("Paket")),
                DataColumn(label: Text("Jamaah")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("15 Aug 2026")),
                    DataCell(Text("Umroh")),
                    DataCell(Text("45")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("28 Sep 2026")),
                    DataCell(Text("Japan")),
                    DataCell(Text("32")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("11 Oct 2026")),
                    DataCell(Text("Turkey")),
                    DataCell(Text("28")),
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
