import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/controllers/donors_controller.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/registered_ngos/widgets/ngos_table.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class RegisteredNgosPage extends StatelessWidget {
  const RegisteredNgosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    fontWeight: FontWeight.bold,
                    color: dark,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        NgoTable(),

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
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text('Bank Account Number'),
                    ),
                    DataColumn(
                      label: Text('Bank Account Title'),
                      numeric: true,
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      donorsController.donors.length,
                      (index) => DataRow(cells: [
                            DataCell(
                                Text(donorsController.donors[index].userName)),
                            DataCell(Text(donorsController
                                .donors[index].userPhoneNumber)),
                            DataCell(
                                Text(donorsController.donors[index].userEmail)),
                            DataCell(
                                Text(donorsController.donors[index].bankName)),
                            DataCell(Text(donorsController
                                .donors[index].userAccountNumber)),
                            DataCell(Text(donorsController
                                .donors[index].userAccountTitle)),
                          ])));

              /*
              if (donorsController != null && donorsController.donors != null) {
                return Expanded(
                    child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Text(donorsController.donors[index].userName);
                  },
                  itemCount: donorsController.donors.length,
                ));
              } else {
                return Text("Warr gye");
              }*/
            })*/
      ],
    );
  }
}
