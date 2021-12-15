import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class SmallNgoInfoDataCell extends StatelessWidget {
  const SmallNgoInfoDataCell({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
              text: title,
              size: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10,
          ),
          CustomText(
              text: description,
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal)
        ],
      ),
    );
  }
}
