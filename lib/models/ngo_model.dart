import 'package:cloud_firestore/cloud_firestore.dart';

class NgoModel {
  late String uid;
  late String profileImage;
  late String moderatorPhoneNumber;
  late String moderatorName;
  late String moderatorEmail;
  late String fcmToken;
  late String cnicImage;
  late String bankName;
  late String certificateUrl;
  late String ngoAccountNumber;
  late String ngoAccountTitle;
  late int ngoBranchCode;
  late String ngoEmail;
  late String ngoName;
  late String ngoRegistrationNumber;
  late bool isVerified;
  //late List<dynamic> uploadedDonations;

  NgoModel({
    required this.uid,
    required this.profileImage,
    required this.moderatorPhoneNumber,
    required this.moderatorName,
    required this.moderatorEmail,
    required this.fcmToken,
    required this.cnicImage,
    required this.isVerified,
    required this.bankName,
    required this.certificateUrl,
    required this.ngoAccountNumber,
    required this.ngoAccountTitle,
    required this.ngoBranchCode,
    required this.ngoEmail,
    required this.ngoName,
    required this.ngoRegistrationNumber,
  });

  NgoModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    uid = queryDocumentSnapshot.data()['uid'] ?? "";
    profileImage = queryDocumentSnapshot.data()['profileImage'] ?? "";
    moderatorPhoneNumber =
        queryDocumentSnapshot.data()['moderatorPhoneNumber'] ?? "";
    moderatorName = queryDocumentSnapshot.data()['moderatorName'] ?? "";
    moderatorEmail = queryDocumentSnapshot.data()['moderatorEmail'] ?? "";
    isVerified = queryDocumentSnapshot.data()['isVerified'] ?? false;
    fcmToken = queryDocumentSnapshot.data()['fcmToken'] ?? "";
    cnicImage = queryDocumentSnapshot.data()['cnicImage'] ?? "";
    bankName = queryDocumentSnapshot.data()['bankName'] ?? "";
    certificateUrl = queryDocumentSnapshot.data()['certificateUrl'] ?? "";
    ngoAccountNumber = queryDocumentSnapshot.data()['ngoAccountNumber'] ?? "";
    ngoAccountTitle = queryDocumentSnapshot.data()['ngoAccountTitle'] ?? "";
    ngoBranchCode = queryDocumentSnapshot.data()['ngoBranchCode'] ?? -1;
    ngoEmail = queryDocumentSnapshot.data()['ngoEmail'] ?? "";
    ngoName = queryDocumentSnapshot.data()['ngoName'] ?? "";
    ngoRegistrationNumber =
        queryDocumentSnapshot.data()['ngoRegistrationNumber'] ?? "";
    //uploadedDonations = queryDocumentSnapshot.data()['uploadedDonations'];
  }
}
