import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/small_ngo_info_detail_cell.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class NgoInfoCardSmall extends StatelessWidget {
  const NgoInfoCardSmall({
    Key? key,
    required this.ngoModel,
  }) : super(key: key);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
                text: "NGO Information",
                size: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Reg Number",
            description: ngoModel.ngoRegistrationNumber,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Name",
            description: ngoModel.ngoName,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Ngo Email",
            description: ngoModel.ngoEmail,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Status",
            description: ngoModel.isVerified ? "Verified" : "Not Verified",
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Bank Account Number",
            description: ngoModel.ngoAccountNumber,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Bank Account Title",
            description: ngoModel.ngoAccountTitle,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Bank Name",
            description: ngoModel.bankName,
          ),
          SizedBox(
            height: 20,
          ),
          SmallNgoInfoDataCell(
            title: "Bank Branch Code",
            description: ngoModel.ngoBranchCode.toString(),
          ),
        ],
      ),
    );
  }
}
