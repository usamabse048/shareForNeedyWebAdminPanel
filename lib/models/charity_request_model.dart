import 'package:cloud_firestore/cloud_firestore.dart';

class CharityRequestModel {
  late String title;
  late String uploadedBy;
  late int requiredAmount;
  late String needyPhoneNumber;
  late String charityLocation;
  late int collectedAmount;
  late String description;

  CharityRequestModel(
      {required this.title,
      required this.description,
      required this.uploadedBy,
      required this.requiredAmount,
      required this.collectedAmount,
      required this.charityLocation});

  CharityRequestModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    title = queryDocumentSnapshot.data()['title'];
    uploadedBy = queryDocumentSnapshot.data()['uploadedBy'];
    requiredAmount = queryDocumentSnapshot.data()['requiredAmount'];
    collectedAmount = queryDocumentSnapshot.data()['collectedAmount'];
    description = queryDocumentSnapshot.data()['description'];
    needyPhoneNumber = queryDocumentSnapshot.data()['needyPhoneNumber'];
    charityLocation = queryDocumentSnapshot.data()['charityLocation'];
  }
}
