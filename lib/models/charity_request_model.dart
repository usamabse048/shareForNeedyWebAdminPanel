import 'package:cloud_firestore/cloud_firestore.dart';

class CharityRequestModel {
  late String title;
  late String uploadedBy;
  late String donationId;
  late int requiredAmount;
  late String needyPhoneNumber;
  late String charityLocation;
  late int collectedAmount;
  late String description;

  late List<dynamic> imageUrl;
  late String moderatorId;
  late List<dynamic> donationTransactions;

  CharityRequestModel({
    required this.title,
    required this.description,
    required this.uploadedBy,
    required this.requiredAmount,
    required this.collectedAmount,
    required this.donationId,
    required this.moderatorId,
    required this.charityLocation,
    required this.donationTransactions,
    required this.imageUrl,
    required this.needyPhoneNumber,
  });

  CharityRequestModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    title = queryDocumentSnapshot.data()['title'] ?? "";
    uploadedBy = queryDocumentSnapshot.data()['uploadedBy'] ?? "";
    requiredAmount = queryDocumentSnapshot.data()['requiredAmount'] ?? -1;
    collectedAmount = queryDocumentSnapshot.data()['collectedAmount'] ?? -1;
    description = queryDocumentSnapshot.data()['description'] ?? "";
    needyPhoneNumber = queryDocumentSnapshot.data()['needyPhoneNumber'] ?? "";
    charityLocation = queryDocumentSnapshot.data()['charityLocation'] ?? "";
    donationId = queryDocumentSnapshot.data()['donationId'] ?? "";
    moderatorId = queryDocumentSnapshot.data()['moderatorId'] ?? "";
    imageUrl = queryDocumentSnapshot.data()['imageUrl'] ?? [];
    donationTransactions =
        queryDocumentSnapshot.data()['donationTransactions'] ?? [];
  }
}
