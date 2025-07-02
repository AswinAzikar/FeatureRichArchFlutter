import 'package:FeatureRichArchFlutter/services/get_device_details.dart';

import '/exporter/exporter.dart';
import '/features/splash_screen/splash_screen.dart';
import '/routes/app_routes.dart';
import '/themes/dark_theme.dart';
import '/core/api/dio_helper.dart';
import '/services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'themes/light_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<MyAppState> appKey = GlobalKey<MyAppState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper().init();
  await SharedPreferencesService.i.initialize();
  final deviceDetails = await DeviceInfoService.getDeviceDetails();
  logInfo(deviceDetails);
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //     statusBarBrightness: Brightness.light,
  //   ),
  // );

  runApp(MyApp(key: appKey));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void toggleTheme() {
    appKey.currentState?.toggleTheme();
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() => _isDarkMode = !_isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: true,
        navigatorKey: navigatorKey,
        initialRoute: SplashScreen.path,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        onGenerateInitialRoutes: AppRoutes.onGenerateInitialRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
