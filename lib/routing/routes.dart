const RootRoute = "/";

const OverViewPageDisplayName = "Overview";
const OverViewPageRoute = "/overview";

const AuthenticationPageDisplayName = "Log Out";
const AuthenticationPageRoute = "/auth";

const NgoRegesterationRequestsPageDisplayName = "NGO Verification Request";
const NgoRegesterationRequestsPageRoute = "/ngoregreq";

const ReportsPageDisplayName = "Reports";
const ReportsPageRoute = "/reports";

const RegisteredNgosPageDisplayName = "Registered NGOs";
const RegisteredNgosPageRoute = "/registeredngos";

const CharityRequestsPageDisplayName = "Charity Requests";
const CharityRequestsPageRoute = "/charityrequests";
//const NgoVerificationRoute = "Verify NGOs";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List sideMenuItems = [
  MenuItem(OverViewPageDisplayName, OverViewPageRoute),
  MenuItem(NgoRegesterationRequestsPageDisplayName,
      NgoRegesterationRequestsPageRoute),
  MenuItem(RegisteredNgosPageDisplayName, RegisteredNgosPageRoute),
  MenuItem(CharityRequestsPageDisplayName, CharityRequestsPageRoute),
  MenuItem(ReportsPageDisplayName, ReportsPageRoute),
  MenuItem(AuthenticationPageDisplayName, AuthenticationPageRoute)
];
