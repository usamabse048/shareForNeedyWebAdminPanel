import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class DetailCell extends StatelessWidget {
  final String title;
  final String detail;
  const DetailCell({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: lightGrey.withOpacity(0.5), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
              text: title,
              size: 18,
              color: dark,
              fontWeight: FontWeight.normal),
          Container(
            width: 250,
            child: CustomText(
                text: detail,
                size: 18,
                color: active,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
