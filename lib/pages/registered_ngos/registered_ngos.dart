import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';

import 'package:flutter_web_admin_panel/pages/registered_ngos/widgets/ngos_table.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';

class RegisteredNgosPage extends StatelessWidget {
  const RegisteredNgosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(children: [
              Center(
                child: CustomText(
                    text: "List of All NGOs",
                    size: 24,
                    color: dark,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              NgoTable(),
            ]),
          ),
        ));
  }
}
