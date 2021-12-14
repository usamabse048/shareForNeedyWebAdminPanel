import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/ngo_detail_page.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class NgoVerificationRequestDataTable extends StatelessWidget {
  NgoVerificationRequestDataTable({Key? key}) : super(key: key);
  final TextEditingController _textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ngoController.allVerficationNgosList.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Image(
                  image: AssetImage("assets/images/empty.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: "No Data Found",
                  size: 24,
                  color: active,
                  fontWeight: FontWeight.bold),
            ],
          ),
        );
      } else {
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
                ngoController.bindNgoVerificationListSearchStream(
                    _textEditingController.value.text);

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
                        'Mod Phone',
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
                        'Approve',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    ngoController.verficationNgosList.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text(ngoController
                            .verficationNgosList[index].ngoRegistrationNumber)),
                        DataCell(Text(
                            ngoController.verficationNgosList[index].ngoName)),
                        DataCell(Text(ngoController
                            .verficationNgosList[index].moderatorName)),
                        DataCell(Text(ngoController
                            .verficationNgosList[index].moderatorPhoneNumber)),
                        DataCell(Text(
                          ngoController.verficationNgosList[index].isVerified
                              ? "Verified"
                              : "Pending",
                          style: TextStyle(
                              color: ngoController
                                      .verficationNgosList[index].isVerified
                                  ? Colors.green
                                  : Colors.red),
                        )),
                        DataCell(ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          child: Text(
                            "View Details",
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NgoDetailPage(
                                          streamName: "verificationStream",
                                          ngoModel: ngoController
                                              .verficationNgosList[index],
                                          index: index,
                                        )));
                          },
                        )),
                        DataCell(ngoController.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Text(
                                  "Approve",
                                ),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: "Approve NGO",
                                    textConfirm: "Yes",
                                    textCancel: "No",
                                    buttonColor: active,
                                    cancelTextColor: Colors.black,
                                    confirmTextColor: Colors.white,
                                    middleText: "Are you sure to Approve NGO?",
                                    onConfirm: () {
                                      ngoController.changeNgoStatus(
                                          ngoController
                                              .verficationNgosList[index].uid,
                                          ngoController
                                              .verficationNgosList[index]
                                              .isVerified);
                                      Get.back();
                                    },
                                  );
                                },
                              )),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }
    });
  }
}
