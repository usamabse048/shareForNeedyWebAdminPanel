import 'package:cloud_firestore/cloud_firestore.dart';

class DonationTransaction {
  late String charityRequestId;
  late String charityRequestTitle;
  late String donationAmount;
  late String donorId;
  late String donorName;
  late String recieverId;
  late String recieverName;

  DonationTransaction({
    required this.charityRequestId,
    required this.charityRequestTitle,
    required this.donationAmount,
    required this.donorId,
    required this.donorName,
    required this.recieverId,
    required this.recieverName,
  });

  DonationTransaction.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    charityRequestId = queryDocumentSnapshot.data()['charityRequestId'] ?? "";
    charityRequestTitle =
        queryDocumentSnapshot.data()['charityRequestTitle'] ?? "";
    donationAmount = queryDocumentSnapshot.data()['donationAmount'] ?? "";
    donorId = queryDocumentSnapshot.data()['donorId'] ?? "";
    donorName = queryDocumentSnapshot.data()['donorName'] ?? "";
    recieverId = queryDocumentSnapshot.data()['recieverId'] ?? "";
    recieverName = queryDocumentSnapshot.data()['recieverName'] ?? "";
  }
}
