import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/helpers/responsiveness.dart';
import 'package:flutter_web_admin_panel/widgets/large_screen.dart';
import 'package:flutter_web_admin_panel/widgets/small_screen.dart';
import 'package:flutter_web_admin_panel/widgets/top_navbar.dart';

class SiteLayout extends StatefulWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  _SiteLayoutState createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      appBar: topNavbar(context, scaffoldStateKey),
      drawer: Drawer(),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: LargeScreen(),
      ),
    );
  }
}
