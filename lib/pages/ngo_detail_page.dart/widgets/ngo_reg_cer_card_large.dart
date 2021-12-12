import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class NgoRegCerCardLarge extends StatelessWidget {
  const NgoRegCerCardLarge(
      {Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.grey.shade400, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: title,
              size: 18,
              color: active,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            width: 300,
            child: InkWell(
              onTap: () {
                html.window.open(imgUrl, title, "_blank");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image(
                  image: NetworkImage(
                    imgUrl,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return child;
                    }
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Text("Image not Found")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
