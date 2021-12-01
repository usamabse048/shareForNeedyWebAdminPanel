import 'package:cloud_firestore/cloud_firestore.dart';

class NgoModel {
  late String uid;
  late String profileImage;
  late String moderatorPhoneNumber;
  late String moderatorName;
  late String moderatorEmail;
  late String fcmToken;
  late String cnicImage;

  late bool isVerified;

  NgoModel({
    required this.uid,
    required this.profileImage,
    required this.moderatorPhoneNumber,
    required this.moderatorName,
    required this.moderatorEmail,
    required this.fcmToken,
    required this.cnicImage,
    required this.isVerified,
  });

  NgoModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    uid = queryDocumentSnapshot.data()['uid'];
    profileImage = queryDocumentSnapshot.data()['profileImage'];
    moderatorPhoneNumber = queryDocumentSnapshot.data()['moderatorPhoneNumber'];
    moderatorName = queryDocumentSnapshot.data()['moderatorName'];
    moderatorEmail = queryDocumentSnapshot.data()['moderatorEmail'];
    isVerified = queryDocumentSnapshot.data()['isVerified'];
    fcmToken = queryDocumentSnapshot.data()['fcmToken'];
    cnicImage = queryDocumentSnapshot.data()['cnicImage'];
  }
}
