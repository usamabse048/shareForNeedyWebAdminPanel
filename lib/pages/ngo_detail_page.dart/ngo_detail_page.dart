import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/controllers.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/models/ngo_model.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/mod_charity_requests_dataTable.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/ngo_info_card_large.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/ngo_mod_info_card_large.dart';
import 'package:flutter_web_admin_panel/pages/ngo_detail_page.dart/widgets/ngo_reg_cer_card_large.dart';
import 'package:flutter_web_admin_panel/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NgoDetailPage extends StatelessWidget {
  final NgoModel ngoModel;
  final int index;
  final String streamName;
  NgoDetailPage(
      {Key? key,
      required this.ngoModel,
      required this.index,
      required this.streamName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NGO Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: ResponsiveWidget.isLargeScreen(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              if (streamName == "allNgosStream")
                Obx(() {
                  if (ngoController.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        if (ngoController.ngosList[index].isVerified)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Do you want to Ban NGO?"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      ngoController.changeNgoStatus(
                                          ngoModel.uid, ngoModel.isVerified);
                                    },
                                    child: Text("Ban NGO"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                  )
                                ],
                              )
                            ],
                          ),
                        if (!ngoController.ngosList[index].isVerified)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Do you want to Approve NGO?"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "Approve NGO",
                                          middleText:
                                              "Are you sure you want to Approve NGO?",
                                          textConfirm: "Yes",
                                          textCancel: "No",
                                          onConfirm: () {
                                            ngoController.changeNgoStatus(
                                                ngoModel.uid,
                                                ngoModel.isVerified);
                                          });
                                    },
                                    child: Text("Approve NGO"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                      ],
                    );
                  }
                }),
              if (streamName == "registeredStream")
                Obx(() {
                  if (ngoController.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        if (ngoController.ngosList[index].isVerified)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Do you want to Ban NGO?"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      ngoController.changeNgoStatus(
                                          ngoModel.uid, ngoModel.isVerified);
                                    },
                                    child: Text("Ban NGO"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                  )
                                ],
                              )
                            ],
                          ),
                        if (!ngoController.ngosList[index].isVerified)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Do you want to Approve NGO?"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      ngoController.changeNgoStatus(
                                          ngoModel.uid, ngoModel.isVerified);
                                    },
                                    child: Text("Approve NGO"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                      ],
                    );
                  }
                }),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    if (ResponsiveWidget.isLargeScreen(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NgoInfoCardLarge(
                            ngoModel: ngoModel,
                            checkScreen: true,
                          ),
                          NgoModInfoCardLarge(
                            ngoModel: ngoModel,
                            checkScreen: true,
                          ),
                        ],
                      ),
                    if (ResponsiveWidget.isMediumScreen(context))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NgoInfoCardLarge(
                              ngoModel: ngoModel, checkScreen: false),
                          SizedBox(height: 20),
                          NgoModInfoCardLarge(
                            ngoModel: ngoModel,
                            checkScreen: false,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NgoRegCerCardLarge(
                    title: "NGO Registeration Certificate",
                    imgUrl: ngoModel.certificateUrl,
                  ),
                  NgoRegCerCardLarge(
                    title: "Moderator CNIC",
                    imgUrl: ngoModel.cnicImage,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey.shade400,
                        blurRadius: 6),
                  ],
                ),
                child: Column(
                  children: [
                    CustomText(
                        text: "Charity Requests",
                        size: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ModCharityRequestTable(
                      moderatorId: ngoModel.uid,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
