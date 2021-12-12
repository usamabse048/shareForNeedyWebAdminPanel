import 'package:flutter_web_admin_panel/models/charity_request_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class CharityRequestsController extends GetxController {
  static CharityRequestsController instance = Get.find();
  Database _database = Database();

  RxList<CharityRequestModel> charityRequestsList =
      RxList<CharityRequestModel>();

  List<CharityRequestModel> get charityRequests => charityRequestsList.value;
  RxList<CharityRequestModel> allCharityRequestsList =
      RxList<CharityRequestModel>();

  RxList<CharityRequestModel> charityRequestsWithRespectToNgoList =
      RxList<CharityRequestModel>();

  void bindSearchStream(String query) {
    charityRequestsList.bindStream(_database.searchCharityByCity(query));
  }

  void deleteCharityRequests(String charityId, String moderatorId) {
    Database().deleteCharityRequest(charityId, moderatorId);
  }

  void charityRequestsWithRespectToNGO(String moderatorId) {
    charityRequestsWithRespectToNgoList
        .bindStream(_database.getCharityRequestsWithRespectToNgo(moderatorId));
  }

  @override
  void onInit() {
    allCharityRequestsList.bindStream(_database.charityRequetsStream());
    super.onInit();
  }
}
