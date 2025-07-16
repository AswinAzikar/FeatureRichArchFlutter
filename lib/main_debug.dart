import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:FeatureRichArchFlutter/services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'core/api/base_url_constant.dart';
import 'flavors/flutter_flavors.dart';
import 'main.dart';



void main() async {
  FlavorConfig.initialize(
    const FlavorConfig(
      // baseUrl: 'https://debug.example.com/shahil',
      flavor: Flavor.debug,
      name: 'DEBUG',
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  logError("⚠️ Calling SharedPreferencesService.initialize()");
  await SharedPreferencesService.i.initialize();

  String api = BaseUrlConstant.getBaseUrl(ApiType.baseUrl);
  logWarning('Calling API: $api');

  runApp(MyApp(key: appKey,));
}
