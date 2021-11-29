import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/controllers/charity_requests_controller.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class CharityRequestsTable extends StatelessWidget {
  CharityRequestsTable({Key? key}) : super(key: key);

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
                  text: "Charity Requests",
                  size: 24,
                  color: dark,
                  fontWeight: FontWeight.bold)
            ],
          ),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                hintText: "Enter City Name", suffixIcon: Icon(Icons.search)),
          ),
          Obx(() {
            charityRequestsController
                .bindSearchStream(_textEditingController.value.text);

            return DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Text('Title'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Requied Amount'),
                ),
                DataColumn(
                  label: Text('Collected Amount'),
                ),
                DataColumn(
                  label: Text('NGO'),
                ),
                DataColumn(
                  label: Text('City'),
                ),
              ],
              rows: List<DataRow>.generate(
                charityRequestsController.charityRequests.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(charityRequestsController
                        .charityRequests[index].title)),
                    DataCell(Text(charityRequestsController
                        .charityRequests[index].requiredAmount
                        .toString())),
                    DataCell(Text(charityRequestsController
                        .charityRequests[index].collectedAmount
                        .toString())),
                    DataCell(Text(charityRequestsController
                        .charityRequests[index].uploadedBy)),
                    DataCell(Text(charityRequestsController
                        .charityRequests[index].charityLocation)),
                  ],
                ),
              ),
            );
          })

          /*
          GetX<CharityRequestsController>(
            init: Get.put(CharityRequestsController()),
            builder: (CharityRequestsController charityRequestsController) {
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn2(
                    label: Text('Title'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Requied Amount'),
                  ),
                  DataColumn(
                    label: Text('Collected Amount'),
                  ),
                  DataColumn(
                    label: Text('NGO'),
                  ),
                  DataColumn(
                    label: Text('City'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  charityRequestsController.charityRequests.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(charityRequestsController
                          .charityRequests[index].title)),
                      DataCell(Text(charityRequestsController
                          .charityRequests[index].requiredAmount
                          .toString())),
                      DataCell(Text(charityRequestsController
                          .charityRequests[index].collectedAmount
                          .toString())),
                      DataCell(Text(charityRequestsController
                          .charityRequests[index].uploadedBy)),
                      DataCell(Text(charityRequestsController
                          .charityRequests[index].charityLocation)),
                    ],
                  ),
                ),
              );
            },
          )*/
        ],
      ),
    );
  }
}
