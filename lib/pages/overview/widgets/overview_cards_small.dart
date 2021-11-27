import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/info_card_small.dart';

class OverviewCardsSmallScreen extends StatelessWidget {
  const OverviewCardsSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
              title: "Registered NGOs",
              value: "10",
              topColor: Colors.deepOrange,
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
              title: "Active Charities",
              value: "14",
              topColor: Colors.green,
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
              title: "Total Donors",
              value: "32",
              topColor: Colors.blueGrey,
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
              title: "NGO Requests",
              value: "2",
              topColor: Colors.pink,
              onTap: () {}),
        ],
      ),
    );
  }
}
