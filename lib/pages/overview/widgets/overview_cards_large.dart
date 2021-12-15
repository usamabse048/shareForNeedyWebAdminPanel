import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/pages/banned_donors/banned_donors.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/charity_requests.dart';
import 'package:flutter_web_admin_panel/pages/donors/donors_page.dart';
import 'package:flutter_web_admin_panel/pages/ngo_verfication_request/Ngo_verification_request.dart';

import 'package:flutter_web_admin_panel/pages/overview/widgets/info_card.dart';
import 'package:flutter_web_admin_panel/pages/registered_ngos/registered_ngos.dart';
import 'package:flutter_web_admin_panel/pages/reports/reports_page.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Obx(() => InfoCard(
                title: "All NGOs",
                value: ngoController.allNgosList.length.toString(),
                topColor: Color(0xFF6AD47F),
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
                  title: "NGO Requests",
                  value: ngoController.allVerficationNgosList.length.toString(),
                  topColor: Color(0xFFFFB2A8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (NGOVerificationRequestsPage()),
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: _width / 64,
            ),
            Obx(
              () => InfoCard(
                  title: "Banned Donors",
                  value: donorsController.allBannedDonorsList.length.toString(),
                  topColor: Colors.lightBlue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (BannedDonorsPage()),
                      ),
                    );
                  }),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Obx(
              () => InfoCard(
                  title: "Charity Requests",
                  value: charityRequestsController.allCharityRequestsList.length
                      .toString(),
                  topColor: Color(0xFFF03560),
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
                  title: "All Donors",
                  value: donorsController.allDonorsList.length.toString(),
                  topColor: Colors.brown,
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
                  title: "Reports",
                  value: reportsController.allReportsNotRespondedList.length
                      .toString(),
                  topColor: Colors.teal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (ReportsPage()),
                      ),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}
