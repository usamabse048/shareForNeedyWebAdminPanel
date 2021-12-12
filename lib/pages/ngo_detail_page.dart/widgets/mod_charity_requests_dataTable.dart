import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/widgets/detail_cell.dart';
import 'package:get/get.dart';

class ModCharityRequestTable extends StatelessWidget {
  final String moderatorId;
  const ModCharityRequestTable({Key? key, required this.moderatorId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      charityRequestsController.charityRequestsWithRespectToNGO(moderatorId);

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
              'City',
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
              'View',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: List<DataRow>.generate(
          charityRequestsController.charityRequestsWithRespectToNgoList.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(charityRequestsController
                  .charityRequestsWithRespectToNgoList[index].title)),
              DataCell(Text(charityRequestsController
                  .charityRequestsWithRespectToNgoList[index].requiredAmount
                  .toString())),
              DataCell(Text(charityRequestsController
                  .charityRequestsWithRespectToNgoList[index].collectedAmount
                  .toString())),
              DataCell(Text(charityRequestsController
                  .charityRequestsWithRespectToNgoList[index].charityLocation)),
              DataCell(
                Text(
                  charityRequestsController
                              .charityRequestsWithRespectToNgoList[index]
                              .requiredAmount ==
                          charityRequestsController
                              .charityRequestsWithRespectToNgoList[index]
                              .collectedAmount
                      ? "Completed"
                      : "Active",
                  style: TextStyle(
                      color: charityRequestsController
                                  .charityRequestsWithRespectToNgoList[index]
                                  .requiredAmount ==
                              charityRequestsController
                                  .charityRequestsWithRespectToNgoList[index]
                                  .collectedAmount
                          ? Colors.green
                          : Colors.red),
                ),
              ),
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
                                .charityRequestsWithRespectToNgoList[index]
                                .title),
                            content: Container(
                              height: 600,
                              width: 600,
                              color: Colors.grey[50],
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(charityRequestsController
                                          .charityRequestsWithRespectToNgoList[
                                              index]
                                          .description),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        height: 200,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: charityRequestsController
                                              .charityRequestsWithRespectToNgoList[
                                                  index]
                                              .imageUrl
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int itemIndex) {
                                            return Container(
                                              height: 150,
                                              width: 200,
                                              child: Image.network(
                                                  charityRequestsController
                                                      .charityRequestsWithRespectToNgoList[
                                                          index]
                                                      .imageUrl[itemIndex]),
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
                                        border:
                                            Border.all(color: dark, width: 0.5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          DetailCell(
                                            title: "NGO",
                                            detail: charityRequestsController
                                                .charityRequestsWithRespectToNgoList[
                                                    index]
                                                .uploadedBy,
                                          ),
                                          DetailCell(
                                              title: "City",
                                              detail: charityRequestsController
                                                  .charityRequestsWithRespectToNgoList[
                                                      index]
                                                  .charityLocation),
                                          DetailCell(
                                              title: "Required Amount",
                                              detail: charityRequestsController
                                                  .charityRequestsWithRespectToNgoList[
                                                      index]
                                                  .requiredAmount
                                                  .toString()),
                                          DetailCell(
                                            title: "Collected Amount",
                                            detail: charityRequestsController
                                                .charityRequestsWithRespectToNgoList[
                                                    index]
                                                .collectedAmount
                                                .toString(),
                                          ),
                                          DetailCell(
                                              title: "Needy Phone Number",
                                              detail: charityRequestsController
                                                  .charityRequestsWithRespectToNgoList[
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
                                        border:
                                            Border.all(color: dark, width: 0.5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Donors",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
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
                                                    BorderRadius.circular(8)),
                                            child: charityRequestsController
                                                        .charityRequestsWithRespectToNgoList[
                                                            index]
                                                        .donorsName
                                                        .length ==
                                                    0
                                                ? Container(
                                                    padding: EdgeInsets.all(16),
                                                    width:
                                                        MediaQuery.of(context)
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
                                                    rows:
                                                        List<DataRow>.generate(
                                                      charityRequestsController
                                                          .charityRequestsWithRespectToNgoList[
                                                              index]
                                                          .donorsName
                                                          .length,
                                                      (donorIndex) => DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                              charityRequestsController
                                                                      .charityRequestsWithRespectToNgoList[
                                                                          index]
                                                                      .donorsName[
                                                                  donorIndex],
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(
                                                              charityRequestsController
                                                                  .charityRequestsWithRespectToNgoList[
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
                      .charityRequestsWithRespectToNgoList[index].donationId);
                  print(charityRequestsController
                      .charityRequestsWithRespectToNgoList[index].moderatorId);
                  charityRequestsController.deleteCharityRequests(
                      charityRequestsController
                          .charityRequestsWithRespectToNgoList[index]
                          .donationId,
                      charityRequestsController
                          .charityRequestsWithRespectToNgoList[index]
                          .moderatorId);
                },
              )),
            ],
          ),
        ),
      );
    });
  }
}
