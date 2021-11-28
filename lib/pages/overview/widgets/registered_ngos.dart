import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

/// Example without a datasource
class RegisteredNgosTable extends StatelessWidget {
  const RegisteredNgosTable();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(0.1),
                blurRadius: 12),
          ],
          border: Border.all(color: lightGrey, width: 0.5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                  text: "Registered NGOs",
                  size: 24,
                  color: dark,
                  fontWeight: FontWeight.bold)
            ],
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Text('Registeration Num'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Mod Name'),
                ),
                DataColumn(
                  label: Text('Active Charities'),
                ),
                DataColumn(
                  label: Text('Donation Collected'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                  10,
                  (index) => DataRow(cells: [
                        DataCell(Text('9903211')),
                        DataCell(Text('Al-Hijrah Foundation')),
                        DataCell(Text('Mohmmad Kashan')),
                        DataCell(Text('4')),
                        DataCell(Text('50000 PKR'))
                      ]))),
        ],
      ),
    );
  }
}
