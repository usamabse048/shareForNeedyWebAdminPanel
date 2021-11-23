import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HorizontleMenuItems extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontleMenuItems(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("item not hovering");
      },
      child: Obx(
        () => Container(
          child: Row(children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 6.0,
                height: 40.0,
                color: dark,
              ),
              visible: menuController.isHovering(itemName) ||
                  menuController.isActive(itemName),
            ),
            SizedBox(
              width: _width / 80,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: menuController.returnIconFor(itemName),
            ),
            if (!menuController.isActive(itemName))
              Flexible(
                child: CustomText(
                  text: itemName,
                  color: menuController.isHovering(itemName) ? dark : lightGrey,
                  size: 16,
                  fontWeight: FontWeight.normal,
                ),
              )
            else
              Flexible(
                child: CustomText(
                  text: itemName,
                  color: dark,
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ]),
          color: menuController.isHovering(itemName)
              ? lightGrey.withOpacity(0.1)
              : Colors.transparent,
        ),
      ),
    );
  }
}
