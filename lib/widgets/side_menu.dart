import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/authentication/authentication.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:flutter_web_admin_panel/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                          text: "DASHBOARD",
                          size: 18,
                          color: active,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(0.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? "Log out"
                        : itemName,
                    onTap: () {
                      if (itemName == "Log out") {
                        Get.offAll(AuthenticationPage());
                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(itemName);
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
