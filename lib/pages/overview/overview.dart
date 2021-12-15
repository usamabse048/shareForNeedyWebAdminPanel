import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_small.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'dart:html' as html;

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: active,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome back !",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        if (ResponsiveWidget.isLargeScreen(context))
                          OverviewCardsLargeScreen()
                        else if (ResponsiveWidget.isMediumScreen(context))
                          OverviewCardsMediumScreen()
                        else
                          OverviewCardsSmallScreen(),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                            text: "Important Sources",
                            size: 24,
                            color: active,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                            text:
                                "Kindly use these sources to verify/approve NGOs on Share For Needy",
                            size: 24,
                            color: active,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 20,
                        ),
                        ResponsiveWidget.isSmallScreen(context)
                            ? Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        html.window.open(
                                            "https://swd.punjab.gov.pk/list_of_ngos",
                                            "Punjab Welfare",
                                            "_blank");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: active),
                                      child: Text(
                                          "Punjab Social Welfare Department")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        html.window.open(
                                            "https://ictadministration.gov.pk/wp-content/uploads/List-of-NGOs.pdf",
                                            "Islamabad Welfare",
                                            "_blank");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: active),
                                      child: Text("Islamabad Registred NGOs")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        html.window.open(
                                            "https://home.sindh.gov.pk/ngo-madarris",
                                            "Sindh Welfare",
                                            "_blank");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: active),
                                      child: Text(
                                          "Sindh Government Home Department")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        html.window.open(
                                            "https://www.swd.balochistan.gov.pk/registered-ngos.html",
                                            "Sindh Welfare",
                                            "_blank");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: active),
                                      child: Text(
                                          "Balochistan Social Welfare Department")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            html.window.open(
                                                "https://swd.punjab.gov.pk/list_of_ngos",
                                                "Punjab Welfare",
                                                "_blank");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: active),
                                          child: Text(
                                              "Punjab Social Welfare Department")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            html.window.open(
                                                "https://ictadministration.gov.pk/wp-content/uploads/List-of-NGOs.pdf",
                                                "Islamabad Welfare",
                                                "_blank");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: active),
                                          child:
                                              Text("Islamabad Registred NGOs")),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            html.window.open(
                                                "https://home.sindh.gov.pk/ngo-madarris",
                                                "Sindh Welfare",
                                                "_blank");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: active),
                                          child: Text(
                                              "Sindh Government Home Department")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            html.window.open(
                                                "https://www.swd.balochistan.gov.pk/registered-ngos.html",
                                                "Sindh Welfare",
                                                "_blank");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: active),
                                          child: Text(
                                              "Balochistan Social Welfare Department")),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),

                  //RegisteredNgosTable()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
