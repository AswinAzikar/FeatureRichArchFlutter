import 'package:FeatureRichArchFlutter/exporter/exporter.dart';
import 'package:FeatureRichArchFlutter/features/splash_screen/splash_screen.dart';
import 'package:FeatureRichArchFlutter/routes/app_routes.dart';

import '/core/api/dio_helper.dart';
import '/features/home_screen/view/home_screen.dart';
import '/services/shared_pref_services.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper().init();
  await SharedPreferencesService.i.initialize();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: SplashScreen.path,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        onGenerateInitialRoutes: AppRoutes.onGenerateInitialRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
