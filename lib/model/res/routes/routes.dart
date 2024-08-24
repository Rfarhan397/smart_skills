
import 'package:get/get.dart';
import 'package:smartyyy/model/res/routes/routes_name.dart';
import 'package:smartyyy/screens/login/login_screen.dart';



class Routes {
  static final routes = [
    GetPage(name: RoutesName.splashScreen, page: () => LoginScreen()),

  ];
}
