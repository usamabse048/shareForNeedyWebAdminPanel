import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/overview_cards_small.dart';

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
