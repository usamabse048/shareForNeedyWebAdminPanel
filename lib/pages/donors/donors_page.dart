import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/donors/widgets/donors_table.dart';

class DonorsPage extends StatelessWidget {
  const DonorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Donors"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              DonorsTable(),
            ],
          ),
        ),
      ),
    );
  }
}
