import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class NgoController extends GetxController {
  static NgoController instance = Get.find();

  RxList<NgoModel> ngosList = RxList<NgoModel>();

  List<NgoModel> get charityRequests => ngosList.value;

  void bindSearchStream(String query) {
    ngosList.bindStream(Database().searchNgoByTitle(query));
  }
}
