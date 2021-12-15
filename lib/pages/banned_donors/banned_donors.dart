import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/banned_donors/widgets/banned_donors_table.dart';

class BannedDonorsPage extends StatelessWidget {
  const BannedDonorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banned Donors"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              BannedDonorsDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
