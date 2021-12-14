import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:flutter_web_admin_panel/widgets/notification_response_form.dart';
import 'package:get/get.dart';

class DonorsTable extends StatelessWidget {
  DonorsTable({Key? key}) : super(key: key);

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
                  text: "Donors",
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
            donorsController
                .bindStreamSearchDonor(_textEditingController.value.text);

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
                    'Bank Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bank Account Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bank Account Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Notify',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                donorsController.donors.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(donorsController.donors[index].userName)),
                    DataCell(
                        Text(donorsController.donors[index].userPhoneNumber)),
                    DataCell(Text(donorsController.donors[index].userEmail)),
                    DataCell(Text(donorsController.donors[index].bankName)),
                    DataCell(
                        Text(donorsController.donors[index].userAccountNumber)),
                    DataCell(
                        Text(donorsController.donors[index].userAccountTitle)),
                    DataCell(
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: active),
                        child: Text(
                          "Notify",
                        ),
                        onPressed: () {
                          print(
                              "fcm token in donor table ${donorsController.donors[index].fcmToken}");
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Center(
                                child: CustomText(
                                    text: "Notify",
                                    size: 24,
                                    color: active,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: SingleChildScrollView(
                                child: ResponseForm(
                                  recieverToken:
                                      donorsController.donors[index].fcmToken,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

/*

          GetX<DonorsController>(
            init: Get.put(DonorsController()),
            builder: (DonorsController donorsController) {
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn2(
                    label: Text('Name'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Phone'),
                  ),
                  DataColumn(
                    label: Text('Email'),
                  ),
                  DataColumn(
                    label: Text('Bank Name'),
                  ),
                  DataColumn(
                    label: Text('Bank Account Number'),
                  ),
                  DataColumn(
                    label: Text('Bank Account Title'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  donorsController.donors.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(donorsController.donors[index].userName)),
                      DataCell(
                          Text(donorsController.donors[index].userPhoneNumber)),
                      DataCell(Text(donorsController.donors[index].userEmail)),
                      DataCell(Text(donorsController.donors[index].bankName)),
                      DataCell(Text(
                          donorsController.donors[index].userAccountNumber)),
                      DataCell(Text(
                          donorsController.donors[index].userAccountTitle)),
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
