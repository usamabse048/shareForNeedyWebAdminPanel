import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/overview/widgets/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
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
        ]),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            InfoCard(
                title: "Total Donors",
                value: "32",
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
            SizedBox(
              width: _width / 64,
            ),
          ],
        )
      ],
    );
  }
}
