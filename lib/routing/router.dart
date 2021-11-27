import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/authentication/authentication.dart';
import 'package:flutter_web_admin_panel/pages/ngo_list/ngo_list.dart';
import 'package:flutter_web_admin_panel/pages/ngo_requests/ngo_requests.dart';
import 'package:flutter_web_admin_panel/pages/overview/overview.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverviewPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    case NgoRegesterationRequestsRoute:
      return _getPageRoute(NgoRequestsPage());

    case ReportsRoute:
      return _getPageRoute(NgoListPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
