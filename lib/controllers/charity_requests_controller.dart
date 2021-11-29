import 'package:flutter_web_admin_panel/models/charity_request_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class CharityRequestsController extends GetxController {
  static CharityRequestsController instance = Get.find();

  RxList<CharityRequestModel> charityRequestsList =
      RxList<CharityRequestModel>();
  List<CharityRequestModel> get charityRequests => charityRequestsList.value;

  var query = "".obs;
  void changeQueryValue(String value) {
    query.value = value;
    print(query.value);
  }

  void bindSearchStream(String query) {
    charityRequestsList.bindStream(Database().searchCharityByCity(query));
  }

  @override
  void onInit() {
    //charityRequestsList.bindStream(Database().charityRequetsStream());
    //charityRequestsList.bindStream(Database().searchCharityByCity(query.value));
    super.onInit();
  }
}
