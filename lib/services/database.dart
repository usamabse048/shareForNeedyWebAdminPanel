import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_admin_panel/models/charity_request_model.dart';
import 'package:flutter_web_admin_panel/models/donor.dart';

import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/models/report_model.dart';

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
  }

// get all charity requests
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

  // get Charity requests w.r.t ngo

  Stream<List<CharityRequestModel>> getCharityRequestsWithRespectToNgo(
      String moderatorId) {
    return _firestore
        .collection('moderators')
        .doc(moderatorId)
        .collection('moderator_donations')
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<CharityRequestModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(CharityRequestModel.fromQueryDocumentSnapshot(element));
      });
      return retval;
    });
  }

// search charity requests with query
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

  // change donor status
  Future<void> changeDonorStatus(String donorId, bool currentStatus) {
    if (currentStatus) {
      return _firestore
          .collection('users')
          .doc(donorId)
          .update({'isVerified': false})
          .then((value) => print("Donor status updated false"))
          .catchError(
              (error) => print("Donor status update failed with $error"));
    } else {
      return _firestore
          .collection('users')
          .doc(donorId)
          .update({'isVerified': true})
          .then((value) => print("Donor status updated true"))
          .catchError(
              (error) => print("Donor status update failed with $error"));
    }
  }

// get all banned donors

  Stream<List<DonorModel>> allBannedDonorsList() {
    return _firestore
        .collection('users')
        .where('isVerified', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<DonorModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(DonorModel.fromDocumentSnapshot(element));
      });
      return retval;
    });
  }

  // search banned donors with query
  Stream<List<DonorModel>> searchBannedDonorsByName(String query) {
    if (query == "") {
      return _firestore
          .collection('users')
          .where('isVerified', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<DonorModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(DonorModel.fromDocumentSnapshot(element));
        });
        return retval;
      });
    } else {
      return _firestore
          .collection('users')
          .where('searchKeywords', arrayContains: query)
          .where('isVerified', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<DonorModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(DonorModel.fromDocumentSnapshot(element));
        });
        return retval;
      });
    }
  }

  // search donors with query
  Stream<List<DonorModel>> searchDonorsByName(String query) {
    if (query == "") {
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
    } else {
      return _firestore
          .collection('users')
          .where('searchKeywords', arrayContains: query)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<DonorModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(DonorModel.fromDocumentSnapshot(element));
        });
        return retval;
      });
    }
  }
  // delete charity request

  Future<void> deleteCharityRequest(
      String charityId, String moderatorId) async {
    await _firestore
        .collection('donations')
        .doc(charityId)
        .delete()
        .then((value) => print("Charity Deleted from donations"))
        .catchError((error) => print("Failed to delete user: $error"));

    await _firestore
        .collection('moderators')
        .doc(moderatorId)
        .update({
          'uploadedDonations': FieldValue.arrayRemove([charityId])
        })
        .then((value) => print("Charity Deleted from Moderator data"))
        .catchError((error) =>
            print("Failed to delete charity request from moderator: $error"));

    await _firestore
        .collection('moderators')
        .doc(moderatorId)
        .collection('moderator_donations')
        .doc(charityId)
        .delete()
        .then((value) => print("charity deleted from nested collectiom"))
        .catchError((error) => print(
            "Failed to delete charity request from moderator nested collection: $error"));
  }

//get ngo details

  // Future<NgoDetailModel> getNgoDetail(String id) async {
  //   try {
  //     NgoDetailModel ngoDetailModel = await _firestore
  //         .collection('moderators')
  //         .doc(id)
  //         .collection('NGODetails')
  //         .doc(id)
  //         .get()
  //         .then((DocumentSnapshot documentSnapshot) {
  //       return NgoDetailModel.fromDocumentSnapshot(documentSnapshot);
  //     });

  //     return ngoDetailModel;
  //   } catch (e) {
  //     print(e.toString());
  //     rethrow;
  //   }

  //   //   .map((DocumentSnapshot documentSnapshot) {
  //   // return NgoDetailModel.fromDocumentSnapshot(documentSnapshot);
  // }

// get all ngos

  Stream<List<NgoModel>> getNgos() {
    return _firestore
        .collection('moderators')
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<NgoModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(NgoModel.fromQueryDocumentSnapshot(element));
      });
      print(retval.length);
      return retval;
    });
  }

  // search Ngos by query
  Stream<List<NgoModel>> searchNgoByTitle(String query) {
    if (query == "") {
      return _firestore
          .collection('moderators')
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<NgoModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(NgoModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    } else {
      return _firestore
          .collection('moderators')
          .where('searchKeywords', arrayContains: query)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<NgoModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(NgoModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    }
  }

  Stream<List<ReportModel>> allReportsNotResponded() {
    return _firestore
        .collection('ngo_reports')
        .where('isResponded', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<ReportModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(ReportModel.fromQueryDocumentSnapshot(element));
      });
      return retval;
    });
  }

  Future<void> dismissReport(String reportId) {
    return _firestore
        .collection('ngo_reports')
        .doc(reportId)
        .update({'isResponded': true}).then((value) {
      print("report dismissed");
      //return true;
    }).catchError((error) {
      print("Failed to update user: $error");
      // return true;
    });
  }

  // search ngo verification list by query

  Stream<List<NgoModel>> searchUnverifieldNgoByTitle(String query) {
    if (query == "") {
      return _firestore
          .collection('moderators')
          .where('isVerified', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<NgoModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(NgoModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    } else {
      return _firestore
          .collection('moderators')
          .where('searchKeywords', arrayContains: query)
          .where('isVerified', isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
        List<NgoModel> retval = [];
        querySnapshot.docs.forEach((element) {
          retval.add(NgoModel.fromQueryDocumentSnapshot(element));
        });
        return retval;
      });
    }
  }

  // full ngo  verification list
  Stream<List<NgoModel>> getNgosVerficationList() {
    return _firestore
        .collection('moderators')
        .where('isVerified', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<NgoModel> retval = [];
      querySnapshot.docs.forEach((element) {
        retval.add(NgoModel.fromQueryDocumentSnapshot(element));
      });
      print(retval.length);
      return retval;
    });
  }

  Future<void> changeNgoStatus(String moderatorId, bool currentStatus) {
    if (currentStatus) {
      return _firestore
          .collection('moderators')
          .doc(moderatorId)
          .update({'isVerified': false})
          .then((value) => print("NGO Status Upadated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      return _firestore
          .collection('moderators')
          .doc(moderatorId)
          .update({'isVerified': true})
          .then((value) => print("NGO Status Upadated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
  }
  // get charity requests with time stamp

  // Stream<List<CharityRequestModel>> getCharityRequetsByTimeStamp( Timestamp timestamp){
  //   return _firestore.collection('donations').where('createdAt' ,isEqualTo: timestamp).snapshots().map((QuerySnapshot<Map<String, dynamic>> querySnapshot){
  //     List<CharityRequestModel> retval = [];
  //     querySnapshot.docs.

  //   }));

//  }

}
