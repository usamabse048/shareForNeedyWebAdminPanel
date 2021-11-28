import 'package:cloud_firestore/cloud_firestore.dart';

class DonorModel {
  late String uid;
  late String userName;
  late String userEmail;
  late String userPhoneNumber;
  late String userAccountTitle;
  late String userAccountNumber;
  late String fcmToken;
  late String imageUrl;
  late String bankName;
  late String branchCode;

  DonorModel(
      {required this.uid,
      required this.userName,
      required this.userEmail,
      required this.userPhoneNumber,
      required this.userAccountTitle,
      required this.userAccountNumber,
      required this.fcmToken,
      required this.imageUrl,
      required this.bankName,
      required this.branchCode});

  DonorModel.fromDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    uid = documentSnapshot.data()['uid'];
    userName = documentSnapshot.data()['userName'];
    userEmail = documentSnapshot.data()['userEmail'];
    userPhoneNumber = documentSnapshot.data()['userPhoneNumber'];
    userAccountTitle = documentSnapshot.data()['userAccountTitle'];
    userAccountNumber = documentSnapshot.data()['userAccountNumber'];
    fcmToken = documentSnapshot.data()['fcmToken'];
    imageUrl = documentSnapshot.data()['imageUrl'];
    bankName = documentSnapshot.data()['bankName'];
    branchCode = documentSnapshot.data()['branchCode'];
  }
}
