import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final VoidCallback onTap;
  const InfoCardSmall(
      {Key? key,
      required this.title,
      required this.value,
      required this.topColor,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isActive ? active : lightGrey, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: title,
                size: 24,
                color: isActive ? active : lightGrey,
                fontWeight: FontWeight.w300),
            SizedBox(
              width: MediaQuery.of(context).size.width / 64,
            ),
            CustomText(
                text: value,
                size: 24,
                color: dark,
                fontWeight: FontWeight.w300),
          ],
        ),
      ),
    ));
  }
}
