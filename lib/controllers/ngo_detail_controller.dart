import 'package:flutter_web_admin_panel/models/ngo_detail_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class NgoDetailController extends GetxController {
  static NgoDetailController instance = Get.find();
  Rx<NgoDetailModel> ngoDetail = NgoDetailModel(
          bankName: '',
          ngoAccountNumber: '',
          certificateUrl: '',
          ngoAccountTitle: '',
          ngoBranchCode: -1,
          ngoEmail: '',
          ngoName: '',
          ngoRegistrationNumber: '')
      .obs;

  var done = false.obs;

  NgoDetailModel get detail => ngoDetail.value;
  bool get doneValue => done.value;

  bool runNgoDetail(String id) {
    getNgoDetail(id);

    if (done.value) {
      return true;
    } else {
      return false;
    }
  }
  //TODO::  correct database and retry ngo detail screen

  Future<bool> getNgoDetail(String id) async {
    done = false as RxBool;
    await Database().getNgoDetail(id).then((value) {
      ngoDetail = value as Rx<NgoDetailModel>;
      done = true as RxBool;
    });

    return true;
  }
}
