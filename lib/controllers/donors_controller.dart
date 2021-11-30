import 'package:flutter_web_admin_panel/models/donor.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class DonorsController extends GetxController {
  static DonorsController instance = Get.find();
  RxList<DonorModel> donorsList = RxList<DonorModel>();

  List<DonorModel> get donors => donorsList.value;

  void bindStreamSearchDonor(String query) {
    donorsList.bindStream(Database().searchDonorsByName(query));
  }
}
