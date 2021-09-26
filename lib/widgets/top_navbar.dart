import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';

AppBar topNavbar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(14, 0.0, 0.0, 0.0),
                child: Image.asset("assets/icons/logo.png"),
              )
            ],
          )
        : IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              key.currentState!.openDrawer();
            },
          ),
    elevation: 0,
    backgroundColor: Colors.white,
  );
}
