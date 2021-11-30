import 'package:flutter/material.dart';

import 'package:flutter_web_admin_panel/pages/overview/widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InfoCard(
            title: "Registered NGOs",
            value: "10",
            topColor: Colors.deepOrange,
            onTap: () {}),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
            title: "Active Charities",
            value: "14",
            topColor: Colors.green,
            onTap: () {}),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
            title: "Total Donors",
            value: "2",
            topColor: Colors.blueGrey,
            onTap: () {}),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
            title: "NGO Requests",
            value: "2",
            topColor: Colors.pink,
            onTap: () {}),
      ],
    );
  }
}
