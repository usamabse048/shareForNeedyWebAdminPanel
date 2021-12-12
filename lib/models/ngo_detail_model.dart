// import 'package:cloud_firestore/cloud_firestore.dart';

// class NgoDetailModel {
//   late String bankName;
//   late String certificateUrl;
//   late String ngoAccountNumber;
//   late String ngoAccountTitle;
//   late int ngoBranchCode;
//   late String ngoEmail;
//   late String ngoName;
//   late String ngoRegistrationNumber;

//   NgoDetailModel({
//     required this.bankName,
//     required this.certificateUrl,
//     required this.ngoAccountNumber,
//     required this.ngoAccountTitle,
//     required this.ngoBranchCode,
//     required this.ngoEmail,
//     required this.ngoName,
//     required this.ngoRegistrationNumber,
//   });

//   NgoDetailModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
//     bankName = documentSnapshot.get('bankName');
//     certificateUrl = documentSnapshot.get('certificateUrl');
//     ngoAccountNumber = documentSnapshot.get('ngoAccountNumber');
//     ngoAccountTitle = documentSnapshot.get('ngoAccountTitle');
//     ngoBranchCode = documentSnapshot.get('ngoBranchCode');
//     ngoEmail = documentSnapshot.get('ngoEmail');
//     ngoName = documentSnapshot.get('ngoName');
//     ngoAccountNumber = documentSnapshot.get('ngoRegistrationNumber');
//   }
// }
