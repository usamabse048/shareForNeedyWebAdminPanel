import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

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
    title: Row(
      children: [
        Visibility(
          child: CustomText(
            text: "Dashboard",
            color: lightGrey,
            fontWeight: FontWeight.bold,
            size: 20.0,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: dark.withOpacity(0.7),
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: dark.withOpacity(0.7),
              ),
            ),
            Positioned(
              child: Container(
                width: 12.0,
                height: 12.0,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: active,
                    border: Border.all(color: light, width: 2),
                    borderRadius: BorderRadius.circular(50.0)),
              ),
              right: 7.0,
              top: 7.0,
            )
          ],
        ),
        Container(
          width: 1,
          height: 22.0,
          color: lightGrey,
        ),
        SizedBox(
          width: 24.0,
        ),
        CustomText(
            text: "Share For Needy",
            size: 16,
            color: lightGrey,
            fontWeight: FontWeight.normal),
        SizedBox(
          width: 16.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            child: CircleAvatar(
              child: Icon(
                Icons.person_outline,
                color: dark,
              ),
              backgroundColor: light,
            ),
          ),
        )
      ],
    ),
    iconTheme: IconThemeData(
      color: dark,
    ),
    backgroundColor: Colors.transparent,
  );
}
