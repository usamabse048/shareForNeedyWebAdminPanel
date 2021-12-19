import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/donor.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class DonorsController extends GetxController {
  static DonorsController instance = Get.find();
  Database _database = Database();
  RxList<DonorModel> donorsList = RxList<DonorModel>();
  RxList<DonorModel> allDonorsList = RxList<DonorModel>();
  RxList<DonorModel> allBannedDonorsList = RxList<DonorModel>();
  RxList<DonorModel> bannedDonorsSearchList = RxList<DonorModel>();

  bool isDonorStatusChanging = false;

  List<DonorModel> get donors => donorsList.value;

  void bindStreamWithBannedDonorsSearchList(String query) {
    bannedDonorsSearchList
        .bindStream(_database.searchBannedDonorsByName(query));
  }

  void bindStreamSearchDonor(String query) {
    donorsList.bindStream(Database().searchDonorsByName(query));
  }

  void changeDonorStatus(
      String donorId, bool currentStatus, BuildContext context) async {
    Get.back();
    ProgressDialog pd = ProgressDialog(context: context);
    isDonorStatusChanging = true;
    pd.show(max: 100, msg: "Updating Donor Status");
    await _database.changeDonorStatus(donorId, currentStatus);
    isDonorStatusChanging = false;
    if (!isDonorStatusChanging) {
      pd.close();
    }
  }

  @override
  void onInit() {
    allDonorsList.bindStream(_database.donorStream());
    allBannedDonorsList.bindStream(_database.allBannedDonorsList());
    super.onInit();
  }
}
