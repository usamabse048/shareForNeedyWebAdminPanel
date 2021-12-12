import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/widgets/detail_cell.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class NgoInfoCardLarge extends StatelessWidget {
  const NgoInfoCardLarge({
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
              offset: Offset(0, 1), color: Colors.grey.shade400, blurRadius: 6)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
                text: "NGO Information",
                size: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          DetailCell(
              title: "Registration Number",
              detail: ngoModel.ngoRegistrationNumber),
          DetailCell(title: "Name", detail: ngoModel.ngoName),
          DetailCell(title: "NGO Email", detail: ngoModel.ngoEmail),
          DetailCell(
              title: "Status",
              detail: ngoModel.isVerified ? "Verified" : "Not Verified"),
          DetailCell(
              title: "Bank Account Number", detail: ngoModel.ngoAccountNumber),
          DetailCell(
              title: "Bank Account Title", detail: ngoModel.ngoAccountTitle),
          DetailCell(title: "Bank Name", detail: ngoModel.bankName),
          DetailCell(
              title: "Bank Branch Code",
              detail: ngoModel.ngoBranchCode.toString()),
        ],
      ),
    );
  }
}
