import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';

import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class NgoTable extends StatelessWidget {
  NgoTable({Key? key}) : super(key: key);
  final TextEditingController _textEditingController =
      new TextEditingController();

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
                  text: "NGOs",
                  size: 24,
                  color: dark,
                  fontWeight: FontWeight.bold)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                hintText: "Enter Ngo Name", suffixIcon: Icon(Icons.search)),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            ngoController.bindSearchStream(_textEditingController.value.text);

            return DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text(
                    'Mod Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mod Phone Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mod Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                ngoController.ngosList.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text("data")),
                    DataCell(Text(
                        ngoController.ngosList[index].moderatorPhoneNumber)),
                    DataCell(
                        Text(ngoController.ngosList[index].moderatorEmail)),
                    DataCell(Text("Action")),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
