import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/notification_helper.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:flutter_web_admin_panel/widgets/notification_response_form.dart';
import 'package:get/get.dart';

class ReportsData extends StatelessWidget {
  ReportsData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reportsController.allReportsNotRespondedList.length == 0) {
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
            children: [
              DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                dataRowHeight: 100,
                columns: [
                  DataColumn(
                    label: Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Reported NGO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Reporter Name',
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
                      'Respond',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Dismiss',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: List.generate(
                  reportsController.allReportsNotRespondedList.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(reportsController
                          .allReportsNotRespondedList[index].title)),
                      DataCell(Text(reportsController
                          .allReportsNotRespondedList[index].ngoName)),
                      DataCell(Text(reportsController
                          .allReportsNotRespondedList[index].reporterName)),
                      DataCell(
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: active),
                          child: Text(
                            "View Details",
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Center(
                                        child: CustomText(
                                          text: "Report Details",
                                          color: active,
                                          fontWeight: FontWeight.bold,
                                          size: 24,
                                        ),
                                      ),
                                      content: Container(
                                        height: 500,
                                        width: 600,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CustomText(
                                                  text: "Title",
                                                  size: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(reportsController
                                                  .allReportsNotRespondedList[
                                                      index]
                                                  .title),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CustomText(
                                                  text: "Description",
                                                  size: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(reportsController
                                                  .allReportsNotRespondedList[
                                                      index]
                                                  .reportDescription),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CustomText(
                                                  text: "Reported By",
                                                  size: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(reportsController
                                                  .allReportsNotRespondedList[
                                                      index]
                                                  .reporterName),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CustomText(
                                                  text: "Reported NGO",
                                                  size: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(reportsController
                                                  .allReportsNotRespondedList[
                                                      index]
                                                  .ngoName),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CustomText(
                                                  text:
                                                      "Last Charity Request Viewed",
                                                  size: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(reportsController
                                                  .allReportsNotRespondedList[
                                                      index]
                                                  .charityRequestTitle),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      DataCell(
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: active),
                          child: Text(
                            "Respond",
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Center(
                                  child: CustomText(
                                      text: "Respond",
                                      size: 24,
                                      color: active,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: SingleChildScrollView(
                                  child: ResponseForm(
                                    recieverToken: reportsController
                                        .allReportsNotRespondedList[index]
                                        .reporterFcmToken,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      DataCell(
                        reportsController.isDismissReportLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Text(
                                  "Dismiss",
                                ),
                                onPressed: () {
                                  reportsController.dismissDonorReport(
                                      reportsController
                                          .allReportsNotRespondedList[index]
                                          .reportId);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Report Dissmissed')),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
