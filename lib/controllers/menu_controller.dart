import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverViewPageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isActive(String itemName) {
    if (activeItem.value == itemName) {
      return true;
    } else {
      return false;
    }
  }

  bool isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case AuthenticationPageDisplayName:
        return _customIcon(Icons.lock, itemName);
      case NgoRegesterationRequestsPageDisplayName:
        return _customIcon(Icons.app_registration, itemName);
      case ReportsPageDisplayName:
        return _customIcon(Icons.flag, itemName);
      case RegisteredNgosPageDisplayName:
        return _customIcon(Icons.verified, itemName);
      case CharityRequestsPageDisplayName:
        return _customIcon(Icons.attach_money, itemName);
      default:
        return _customIcon(Icons.trending_up, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    } else {
      return Icon(
        icon,
        color: isHovering(itemName) ? dark : lightGrey,
      );
    }
  }
}
