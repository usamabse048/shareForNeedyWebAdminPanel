import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/authentication/authentication.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/charity_requests.dart';
import 'package:flutter_web_admin_panel/pages/ngo_verfication_request/Ngo_verification_request.dart';

import 'package:flutter_web_admin_panel/pages/overview/overview.dart';
import 'package:flutter_web_admin_panel/pages/registered_ngos/registered_ngos.dart';
import 'package:flutter_web_admin_panel/pages/reports/reports.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverviewPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    case NgoRegesterationRequestsRoute:
      return _getPageRoute(NGOVerificationRequestsPage());

    case ReportsRoute:
      return _getPageRoute(ReportsPage());
    case AllRegisteredNgos:
      return _getPageRoute(RegisteredNgosPage());
    case AllCharityRequests:
      return _getPageRoute(CharityRequestsPage());

    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
