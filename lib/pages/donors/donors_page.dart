import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/donors/widgets/donors_table.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class DonorsPage extends StatelessWidget {
  const DonorsPage({Key? key}) : super(key: key);

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
        DonorsTable()
      ],
    );
  }
}
