import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/charity_requests.dart';
import 'package:flutter_web_admin_panel/pages/donors/donors_page.dart';
import 'package:flutter_web_admin_panel/pages/ngo_verfication_request/Ngo_verification_request.dart';

import 'package:flutter_web_admin_panel/pages/overview/widgets/info_card.dart';
import 'package:flutter_web_admin_panel/pages/registered_ngos/registered_ngos.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Obx(() => InfoCard(
            title: "Registered NGOs",
            value: ngoController.allNgosList.length.toString(),
            topColor: Colors.deepOrange,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisteredNgosPage()));
            })),
        SizedBox(
          width: _width / 64,
        ),
        Obx(
          () => InfoCard(
              title: "Charity Requests",
              value: charityRequestsController.allCharityRequestsList.length
                  .toString(),
              topColor: Colors.green,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (CharityRequestsPage())));
              }),
        ),
        SizedBox(
          width: _width / 64,
        ),
        Obx(
          () => InfoCard(
              title: "Total Donors",
              value: donorsController.allDonorsList.length.toString(),
              topColor: Colors.blueGrey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (DonorsPage()),
                  ),
                );
              }),
        ),
        SizedBox(
          width: _width / 64,
        ),
        Obx(
          () => InfoCard(
              title: "NGO Requests",
              value: ngoController.verficationNgosList.length.toString(),
              topColor: Colors.pink,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (NGOVerificationRequestsPage()),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
