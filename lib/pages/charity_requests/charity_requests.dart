import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/widgets/charity_requests_table.dart';

class CharityRequestsPage extends StatelessWidget {
  const CharityRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Charity Requests"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              CharityRequestsTable(),
            ],
          ),
        ),
      ),
    );
  }
}
