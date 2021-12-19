import 'package:http/http.dart' as http;
import 'dart:convert';

const String SERVER_KEY =
    "AAAAUMh5ZjM:APA91bG_8j9e-DYvb99k-1MYYTdoVeDJo81NNj-ntvtsJybEctI4C239bjsViqyro48U5PgJWfTVaQTAaLDXGienXKrhTkIFo9lEMftoWW6geL9O39CQC3IK5MdNOaU50VxpsgRBCwA4";

void sendNotification(
    {required String recieverToken,
    required String title,
    required String body,
    required Map<String, dynamic> payload}) async {
  print("Activating send notification service");
  await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$SERVER_KEY',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': payload,
        'to': recieverToken
      },
    ),
  );
}
