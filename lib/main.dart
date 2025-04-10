import '/core/api/dio_helper.dart';
import '/features/home_screen/view/home_screen.dart';
import '/services/shared_pref_services.dart';

import 'package:flutter/material.dart';

void main() async {

  //TODO : Add this to the template
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper().init();
  await SharedPreferencesService.i.initialize();
  // upto this line
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // onGenerateRoute: AppRoutes.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}
