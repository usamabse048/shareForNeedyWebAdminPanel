import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/reports/widgets/reports_data.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: ReportsData(),
        ),
      ),
    );
  }
}
