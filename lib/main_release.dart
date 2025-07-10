import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:flutter/material.dart';
import 'core/api/base_url_constant.dart';
import 'flavors/flutter_flavors.dart';
import 'main.dart';

void main() {
  FlavorConfig.initialize(
  FlavorConfig(
    flavor: Flavor.release,
     baseUrl: 'https://debug.example.com/base',
    name: 'RELEASE',
   ) );

  String api = BaseUrlConstant.getBaseUrl(ApiType.baseUrl);
  logWarning('Calling API: $api');

  runApp(MyApp());
}
