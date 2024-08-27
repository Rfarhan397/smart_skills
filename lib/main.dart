import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:smartyyy/model/provider/date/date_provider.dart';
import 'model/provider/bottomNavigation/bottom_navigation.dart';
import 'model/provider/listOfRooms/listofrooms_provider.dart';
import 'model/res/routes/routes.dart';
import 'model/res/routes/routes_name.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true

      ,
      builder: (context) =>
      const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation,deviceType){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => BottomNavProvider()),
              ChangeNotifierProvider( create: (context) {
          final today = DateTime.now();
          final startOfMonth = DateTime(today.year, today.month, 1);
          final initialIndex = today.difference(startOfMonth).inDays;
          return DaySelectorProvider(initialIndex: initialIndex);
          },),
              ChangeNotifierProvider(create: (_) => SelectionProvider()),
              ChangeNotifierProvider(create: (_) => DateProvider()),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              getPages: Routes.routes,
              builder: DevicePreview.appBuilder, // Add this line
            ),
          );
        }
    );
  }
}
