import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/constants/style.dart';
import 'package:flutter_web_admin_panel/controllers/charity_requests_controller.dart';
import 'package:flutter_web_admin_panel/controllers/menu_controller.dart';
import 'package:flutter_web_admin_panel/controllers/navigation_controller.dart';
import 'package:flutter_web_admin_panel/pages/404/error_page.dart';
import 'package:flutter_web_admin_panel/pages/authentication/authentication.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';
import 'package:flutter_web_admin_panel/widgets/layout.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CharityRequestsController());

  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthenticationPageRoute,
      unknownRoute: GetPage(name: "/not-found", page: () => PageNotFound()),
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: RootRoute, page: () => SiteLayout()),
        GetPage(
            name: AuthenticationPageRoute, page: () => AuthenticationPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
    );
  }
}
