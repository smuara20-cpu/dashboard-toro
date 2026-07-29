import 'package:flutter/material.dart';

class RecentLeadsTable extends StatelessWidget {
  const RecentLeadsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Leads Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            DataTable(
              columns: const [
                DataColumn(label: Text("Nama")),
                DataColumn(label: Text("Sumber")),
                DataColumn(label: Text("Status")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("Budi")),
                    DataCell(Text("Meta Ads")),
                    DataCell(Text("Follow Up")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("Siti")),
                    DataCell(Text("Instagram")),
                    DataCell(Text("Chat")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("Andi")),
                    DataCell(Text("Website")),
                    DataCell(Text("Prospek")),
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
