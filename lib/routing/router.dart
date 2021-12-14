import 'package:flutter/material.dart';
import 'package:flutter_web_admin_panel/pages/charity_requests/charity_requests.dart';
import 'package:flutter_web_admin_panel/pages/donors/donors_page.dart';
import 'package:flutter_web_admin_panel/pages/ngo_verfication_request/Ngo_verification_request.dart';
import 'package:flutter_web_admin_panel/pages/overview/overview.dart';
import 'package:flutter_web_admin_panel/pages/registered_ngos/registered_ngos.dart';
import 'package:flutter_web_admin_panel/pages/reports/reports_page.dart';
import 'package:flutter_web_admin_panel/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverviewPage());

    case NgoRegesterationRequestsPageRoute:
      return _getPageRoute(NGOVerificationRequestsPage());
    case DonorsPageRoute:
      return _getPageRoute(DonorsPage());

    case ReportsPageRoute:
      return _getPageRoute(ReportsPage());
    case RegisteredNgosPageRoute:
      return _getPageRoute(RegisteredNgosPage());
    case CharityRequestsPageRoute:
      return _getPageRoute(CharityRequestsPage());

    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
