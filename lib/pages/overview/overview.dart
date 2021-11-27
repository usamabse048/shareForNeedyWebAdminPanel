import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_small.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

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
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context))
              OverviewCardsLargeScreen()
            else if (ResponsiveWidget.isMediumScreen(context))
              OverviewCardsMediumScreen()
            else
              OverviewCardsSmallScreen()
          ],
        ))
      ],
    );
  }
}
