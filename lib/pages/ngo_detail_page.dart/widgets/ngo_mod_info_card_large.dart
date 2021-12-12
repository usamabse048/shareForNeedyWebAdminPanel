import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/widgets/detail_cell.dart';
import 'dart:html' as html;

import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class NgoModInfoCardLarge extends StatelessWidget {
  const NgoModInfoCardLarge({
    Key? key,
    required this.ngoModel,
    required this.checkScreen,
  }) : super(key: key);

  final NgoModel ngoModel;
  final bool checkScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: checkScreen
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.grey.shade400, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
                text: "NGO Moderator Information",
                size: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 43,
          ),
          Center(
            child: InkWell(
              onTap: () {
                html.window
                    .open(ngoModel.profileImage, "Profile Pic", "_blank");
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(ngoModel.profileImage),
                minRadius: 100,
              ),
            ),
          ),
          SizedBox(
            height: 43,
          ),
          DetailCell(title: "Mod Name", detail: ngoModel.moderatorName),
          DetailCell(title: "Mod Email", detail: ngoModel.moderatorEmail),
          DetailCell(
              title: "Mod Phone Number", detail: ngoModel.moderatorPhoneNumber),
        ],
      ),
    );
  }
}
