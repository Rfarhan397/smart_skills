import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'model/res/routes/routes.dart';
import 'model/res/routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: false,
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
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Un Respiro',
            initialRoute: RoutesName.splashScreen,
            getPages: Routes.routes,
            builder: DevicePreview.appBuilder, // Add this line
          );
        }
    );
  }
}
