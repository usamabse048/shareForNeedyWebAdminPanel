import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/helpers/notification_helper.dart';
import 'package:get/get.dart';

class ResponseForm extends StatefulWidget {
  const ResponseForm({
    Key? key,
    required this.recieverToken,
  }) : super(key: key);
  final String recieverToken;

  @override
  State<ResponseForm> createState() => _ResponseFormState();
}

class _ResponseFormState extends State<ResponseForm> {
  final TextEditingController _responseTitleController =
      TextEditingController();
  final TextEditingController _responseDescriptionController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Title"),
            TextFormField(
              controller: _responseTitleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Response"),
            TextFormField(
              controller: _responseDescriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel",
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sendNotification(
                          recieverToken: widget.recieverToken,
                          title: _responseTitleController.text,
                          body: _responseDescriptionController.text,
                          payload: <String, dynamic>{});
                      print("fcm token in donor table ${widget.recieverToken}");

                      Get.back();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notification Sent')),
                      );
                    }
                  },
                  child: Text("Send"),
                  style: ElevatedButton.styleFrom(primary: active),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
