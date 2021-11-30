import 'package:flutter_web_admin_panel/models/charity_request_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class CharityRequestsController extends GetxController {
  static CharityRequestsController instance = Get.find();

  RxList<CharityRequestModel> charityRequestsList =
      RxList<CharityRequestModel>();
  List<CharityRequestModel> get charityRequests => charityRequestsList.value;

  void bindSearchStream(String query) {
    charityRequestsList.bindStream(Database().searchCharityByCity(query));
  }

  void deleteCharityRequests(String charityId, String moderatorId) {
    Database().deleteCharityRequest(charityId, moderatorId);
  }
}
