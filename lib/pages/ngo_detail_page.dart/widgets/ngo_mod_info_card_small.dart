import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/small_ngo_info_detail_cell.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'dart:html' as html;

class NgoModInfoCardSmall extends StatelessWidget {
  const NgoModInfoCardSmall({Key? key, required this.ngoModel})
      : super(key: key);
  final NgoModel ngoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
                text: "NGO Moderator Info",
                size: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: () {
                html.window
                    .open(ngoModel.profileImage, "Profile Pic", "_blank");
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(ngoModel.profileImage),
                minRadius: 50,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Mod Name",
            description: ngoModel.moderatorName,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Mod Email",
            description: ngoModel.moderatorEmail,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Mod Phone Number",
            description: ngoModel.moderatorPhoneNumber,
          ),
        ],
      ),
    );
  }
}
