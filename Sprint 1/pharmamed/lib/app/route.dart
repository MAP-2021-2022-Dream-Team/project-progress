import 'package:flutter/material.dart';
import 'package:pharmamed/screens/buyer_landing_page/buyer_landing_screen.dart';
import 'package:pharmamed/screens/login/login_Screen.dart';

class Routers {
  static const String loginPath = '/login';
  static const String buyerLandingPath = '/buyerLanding';

  static dynamic route(dynamic path, BuildContext context) {
    switch (path) {
      case loginPath:
        print("Going to Landing Page");
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );

      case buyerLandingPath:
        print("Going to Buyer Page");
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BuyerLandingPage()),
        );
      default:
        return Text('failed');
    }
  }
}


// @StackedApp(routes: [
//   MaterialRoute(page: Login),
//   MaterialRoute(page: ForgotPassScreen),
//   MaterialRoute(page: BuyerLandingPage),
//   MaterialRoute(page: SellerLandingPage)
// ], dependencies: [
//   LazySingleton(classType: NavigationService),
// ])
// class AppSetup {}