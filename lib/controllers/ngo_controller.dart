import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class NgoController extends GetxController {
  static NgoController instance = Get.find();
  bool isLoading = false;

  Database _database = Database();

  RxList<NgoModel> ngosList = RxList<NgoModel>();
  RxList<NgoModel> allNgosList = RxList<NgoModel>();
  RxList<NgoModel> verficationNgosList = RxList<NgoModel>();
  RxList<NgoModel> allVerficationNgosList = RxList<NgoModel>();

  // List<NgoModel> get charityRequests => ngosList.value;
  // List<NgoModel> get allNgos => allNgosList.value;

  void bindSearchStream(String query) {
    ngosList.bindStream(_database.searchNgoByTitle(query));
  }

  void changeNgoStatus(String moderatorId, bool currentStatus) async {
    isLoading = true;
    await _database.changeNgoStatus(moderatorId, currentStatus);
    isLoading = false;
  }

  void bindNgoVerificationListSearchStream(String query) {
    verficationNgosList
        .bindStream(_database.searchUnverifieldNgoByTitle(query));
  }

  @override
  void onInit() {
    allNgosList.bindStream(_database.getNgos());
    allVerficationNgosList.bindStream(_database.getNgosVerficationList());
    super.onInit();
  }
}
