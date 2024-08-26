
import 'package:get/get.dart';
import 'package:smartyyy/model/res/routes/routes_name.dart';
import 'package:smartyyy/screens/coming_soon/coming_soon.dart';
import 'package:smartyyy/screens/dashboard/dashboard_screen.dart';
import 'package:smartyyy/screens/dashboard/main_screen.dart';
import 'package:smartyyy/screens/login/login_screen.dart';



class Routes {
  static final routes = [
    GetPage(name: RoutesName.splashScreen, page: () => LoginScreen()),
    GetPage(name: RoutesName.mainScreen, page: () => MainScreen()),
    GetPage(name: RoutesName.dashBoard, page: () => DashboardScreen()),
    GetPage(name: RoutesName.comingSoon, page: () => ComingSoon()),

  ];
}
