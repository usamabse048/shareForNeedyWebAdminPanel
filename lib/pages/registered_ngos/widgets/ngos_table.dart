import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/ngo_detail_page.dart';
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _textEditingController,
            cursorColor: active,
            decoration: InputDecoration(
              hintText: "Enter Ngo Name",
              suffixIcon: Icon(
                Icons.search,
                color: active,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: active),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: active, width: 2),
              ),
            ),
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
              dataRowHeight: 100,
              columns: [
                DataColumn(
                  label: Text(
                    'Registeration Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'NGO Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mod Name',
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
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Details',
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
                    DataCell(
                      Text(ngoController.ngosList[index].ngoRegistrationNumber),
                    ),
                    DataCell(Text(ngoController.ngosList[index].ngoName)),
                    DataCell(Text(ngoController.ngosList[index].moderatorName)),
                    DataCell(
                        Text(ngoController.ngosList[index].moderatorEmail)),
                    DataCell(ngoController.ngosList[index].isVerified
                        ? Text(
                            "Verfied",
                            style: TextStyle(color: active),
                          )
                        : Text(
                            "Pending",
                            style: TextStyle(color: Colors.red),
                          )),
                    DataCell(
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text(
                          "View Details",
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NgoDetailPage(
                                streamName: "allNgosStream",
                                ngoModel: ngoController.ngosList[index],
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    DataCell(
                      ngoController.isLoading
                          ? CircularProgressIndicator(
                              color: active,
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      ngoController.ngosList[index].isVerified
                                          ? Colors.red
                                          : active),
                              child: ngoController.ngosList[index].isVerified
                                  ? Text(
                                      "Ban NGO",
                                    )
                                  : Text(
                                      "Approve Ngo",
                                    ),
                              onPressed: () {
                                ngoController.changeNgoStatus(
                                    ngoController.ngosList[index].uid,
                                    ngoController.ngosList[index].isVerified);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Ngo Status Updated')));
                              },
                            ),
                    ),
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
