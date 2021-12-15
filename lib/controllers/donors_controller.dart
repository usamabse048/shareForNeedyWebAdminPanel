import 'package:flutter_web_admin_panel/models/donor.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

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

  void changeDonorStatus(String donorId, bool currentStatus) async {
    isDonorStatusChanging = true;
    await _database.changeDonorStatus(donorId, currentStatus);
    isDonorStatusChanging = false;
  }

  @override
  void onInit() {
    allDonorsList.bindStream(_database.donorStream());
    allBannedDonorsList.bindStream(_database.allBannedDonorsList());
    super.onInit();
  }
}
