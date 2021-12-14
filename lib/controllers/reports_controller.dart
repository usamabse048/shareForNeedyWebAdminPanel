import 'package:flutter_web_admin_panel/models/report_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController {
  static ReportsController instance = Get.find();
  Database _database = Database();

  bool isDismissReportLoading = false;

  RxList<ReportModel> allReportsNotRespondedList = RxList<ReportModel>();

  dismissDonorReport(String reportId) async {
    isDismissReportLoading = true;
    await _database.dismissReport(reportId);
    isDismissReportLoading = false;
  }

  @override
  void onInit() {
    allReportsNotRespondedList.bindStream(_database.allReportsNotResponded());
    super.onInit();
  }
}
