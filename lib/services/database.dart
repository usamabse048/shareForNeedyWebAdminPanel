import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_admin_panel/models/charity_request_model.dart';
import 'package:flutter_web_admin_panel/models/donor.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<DonorModel>> donorStream() {
    return _firestore
        .collection('users')
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<DonorModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(DonorModel.fromDocumentSnapshot(element));
      });
      return retval;
    });

    //     .map((QuerySnapshot querySnapshot) {
    //   List<DonorModel> retval = [];
    //   querySnapshot.docs.forEach((element) {
    //     retval.add(DonorModel.fromDocumentSnapshot(element));

    //   });
    //   return retval;
    // });
  }

  Stream<List<CharityRequestModel>> charityRequetsStream() {
    return _firestore
        .collection('donations')
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<CharityRequestModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(CharityRequestModel.fromQueryDocumentSnapshot(element));
      });
      return retval;
    });
  }

  Stream<List<CharityRequestModel>> searchCharityByCity(String query) {
    if (query == "") {
      return _firestore
          .collection('donations')
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<CharityRequestModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(CharityRequestModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    } else {
      return _firestore
          .collection('donations')
          .where('searchData', arrayContains: query)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<CharityRequestModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(CharityRequestModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    }
  }
}
