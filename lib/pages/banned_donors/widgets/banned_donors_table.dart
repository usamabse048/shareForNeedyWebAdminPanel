import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class BannedDonorsDataTable extends StatelessWidget {
  BannedDonorsDataTable({Key? key}) : super(key: key);
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
                  text: "Banned Donors",
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
            cursorColor: active,
            decoration: InputDecoration(
              hintText: "Enter Donor Name",
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
            donorsController.bindStreamWithBannedDonorsSearchList(
                _textEditingController.value.text);

            return DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              dataRowHeight: 100,
              columns: [
                DataColumn2(
                  label: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text(
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
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
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                donorsController.bannedDonorsSearchList.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(donorsController
                        .bannedDonorsSearchList[index].userName)),
                    DataCell(Text(donorsController
                        .bannedDonorsSearchList[index].userPhoneNumber)),
                    DataCell(Text(donorsController
                        .bannedDonorsSearchList[index].userEmail)),
                    DataCell(donorsController
                            .bannedDonorsSearchList[index].isVerified
                        ? Text(
                            "Active",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            "Banned",
                            style: TextStyle(color: Colors.red),
                          )),
                    DataCell(
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: active),
                        child: Text(
                          "Un Ban",
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Un Ban Donor",
                            textConfirm: "Yes",
                            textCancel: "No",
                            buttonColor: active,
                            cancelTextColor: Colors.black,
                            confirmTextColor: Colors.white,
                            middleText:
                                "Are you sure to you want to Un Ban Donor?",
                            onConfirm: () {
                              donorsController.changeDonorStatus(
                                  donorsController
                                      .bannedDonorsSearchList[index].uid,
                                  donorsController
                                      .bannedDonorsSearchList[index].isVerified,
                                  context);
                            },
                          );
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
