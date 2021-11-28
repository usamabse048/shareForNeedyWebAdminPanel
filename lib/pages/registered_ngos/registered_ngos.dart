import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/controllers/donors_controller.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
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
        GetX<DonorsController>(
            init: Get.put(DonorsController()),
            builder: (DonorsController donorsController) {
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
              }
            })
      ],
    );
  }
}
