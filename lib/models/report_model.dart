import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  late String title;
  late String reportDescription;
  late String reporterName;
  late String reporterId;
  late String ngoId;
  late String ngoName;
  late String reporterFcmToken;
  late String ngoFcmToken;
  late bool isResponded;
  late String reportId;
  late String charityRequestId;
  late String charityRequestTitle;

  ReportModel(
      {required this.title,
      required this.reportDescription,
      required this.reporterName,
      required this.reportId,
      required this.ngoId,
      required this.ngoName,
      required this.reporterFcmToken,
      required this.isResponded,
      required this.reporterId,
      required this.ngoFcmToken,
      required this.charityRequestId,
      required this.charityRequestTitle});

  ReportModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    title = queryDocumentSnapshot.data()['reportTitle'] ?? "";
    reportDescription = queryDocumentSnapshot.data()['reportDescription'] ?? "";
    reporterName = queryDocumentSnapshot.data()['reporterName'] ?? "";
    reporterId = queryDocumentSnapshot.data()['reporterId'] ?? "";
    ngoId = queryDocumentSnapshot.data()['ngoId'] ?? "";
    ngoName = queryDocumentSnapshot.data()['ngoName'] ?? "";
    reporterFcmToken = queryDocumentSnapshot.data()['reporterFcmToken'] ?? "";
    ngoFcmToken = queryDocumentSnapshot.data()['ngoFcmToken'] ?? "";
    isResponded = queryDocumentSnapshot.data()['isResponded'] ?? "";
    reportId = queryDocumentSnapshot.data()['reportId'] ?? "";
    charityRequestId = queryDocumentSnapshot.data()['charityRequestId'] ?? "";
    charityRequestTitle =
        queryDocumentSnapshot.data()['charityRequestTitle'] ?? "";
  }
}
