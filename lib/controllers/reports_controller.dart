import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/models/report_model.dart';
import 'package:flutter_web_admin_panel/services/database.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ReportsController extends GetxController {
  static ReportsController instance = Get.find();
  Database _database = Database();

  bool isDismissReportLoading = false;

  RxList<ReportModel> allReportsNotRespondedList = RxList<ReportModel>();

  dismissDonorReport(String reportId, BuildContext context) async {
    Get.back();
    ProgressDialog pd = ProgressDialog(context: context);
    isDismissReportLoading = true;

    pd.show(max: 100, msg: "Dismissing Report");
    await _database.dismissReport(reportId);
    isDismissReportLoading = false;
    if (!isDismissReportLoading) {
      pd.close();
    }
  }

  @override
  void onInit() {
    allReportsNotRespondedList.bindStream(_database.allReportsNotResponded());
    super.onInit();
  }
}
