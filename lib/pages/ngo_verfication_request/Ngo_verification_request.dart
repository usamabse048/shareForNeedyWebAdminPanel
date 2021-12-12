import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/ngo_verfication_request/widgets/ngo_verification_requests_datatable.dart';

class NGOVerificationRequestsPage extends StatelessWidget {
  const NGOVerificationRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NGO Registeration Requests"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              NgoVerificationRequestDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
