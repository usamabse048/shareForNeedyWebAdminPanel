import 'package:cloud_firestore/cloud_firestore.dart';
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
}
