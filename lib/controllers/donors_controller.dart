import 'package:flutter_web_admin_panel/models/donor.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class DonorsController extends GetxController {
  RxList<DonorModel> donorsList = RxList<DonorModel>();

  List<DonorModel> get donors => donorsList.value;

  @override
  void onInit() {
    donorsList.bindStream(Database().donorStream()); //stream comming from db
  }
}
