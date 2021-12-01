import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/widgets/detail_cell.dart';

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
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                hintText: "Enter City Name", suffixIcon: Icon(Icons.search)),
          ),
          SizedBox(
            height: 20,
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
                  label: Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text(
                    'Requied Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Collected Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'NGO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'City',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
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
                    DataCell(ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text(
                        "View Details",
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  backgroundColor: Colors.grey[50],
                                  title: Text(charityRequestsController
                                      .charityRequests[index].title),
                                  content: Container(
                                    height: 600,
                                    width: 600,
                                    color: Colors.grey[50],
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                                charityRequestsController
                                                    .charityRequests[index]
                                                    .description),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              height: 200,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    charityRequestsController
                                                        .charityRequests[index]
                                                        .imageUrl
                                                        .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int itemIndex) {
                                                  return Container(
                                                    height: 150,
                                                    width: 200,
                                                    child: Image.network(
                                                        charityRequestsController
                                                                .charityRequests[
                                                                    index]
                                                                .imageUrl[
                                                            itemIndex]),
                                                  );
                                                },
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: dark, width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Details",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                DetailCell(
                                                  title: "NGO",
                                                  detail:
                                                      charityRequestsController
                                                          .charityRequests[
                                                              index]
                                                          .uploadedBy,
                                                ),
                                                DetailCell(
                                                    title: "City",
                                                    detail:
                                                        charityRequestsController
                                                            .charityRequests[
                                                                index]
                                                            .charityLocation),
                                                DetailCell(
                                                    title: "Required Amount",
                                                    detail:
                                                        charityRequestsController
                                                            .charityRequests[
                                                                index]
                                                            .requiredAmount
                                                            .toString()),
                                                DetailCell(
                                                  title: "Collected Amount",
                                                  detail:
                                                      charityRequestsController
                                                          .charityRequests[
                                                              index]
                                                          .collectedAmount
                                                          .toString(),
                                                ),
                                                DetailCell(
                                                    title: "Needy Phone Number",
                                                    detail:
                                                        charityRequestsController
                                                            .charityRequests[
                                                                index]
                                                            .needyPhoneNumber),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: dark, width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Donors",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: lightGrey
                                                              .withOpacity(0.5),
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: charityRequestsController
                                                              .charityRequests[
                                                                  index]
                                                              .donorsName
                                                              .length ==
                                                          0
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Center(
                                                            child: Text(
                                                                "No Donations Collected Yet"),
                                                          ),
                                                        )
                                                      : DataTable2(
                                                          columns: [
                                                            DataColumn(
                                                              label: Text(
                                                                'Name',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            DataColumn(
                                                              label: Text(
                                                                'Donated Amount',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            charityRequestsController
                                                                .charityRequests[
                                                                    index]
                                                                .donorsName
                                                                .length,
                                                            (donorIndex) =>
                                                                DataRow(
                                                              cells: [
                                                                DataCell(
                                                                  Text(
                                                                    charityRequestsController
                                                                        .charityRequests[
                                                                            index]
                                                                        .donorsName[donorIndex],
                                                                  ),
                                                                ),
                                                                DataCell(
                                                                  Text(
                                                                    charityRequestsController
                                                                        .charityRequests[
                                                                            index]
                                                                        .donorsDonateAmount[
                                                                            donorIndex]
                                                                        .toString(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      },
                    )),
                    DataCell(ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text(
                        "Delete",
                      ),
                      onPressed: () {
                        print(charityRequestsController
                            .charityRequests[index].donationId);
                        print(charityRequestsController
                            .charityRequests[index].moderatorId);
                        charityRequestsController.deleteCharityRequests(
                            charityRequestsController
                                .charityRequests[index].donationId,
                            charityRequestsController
                                .charityRequests[index].moderatorId);
                      },
                    )),
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
