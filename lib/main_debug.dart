import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:flutter/material.dart';
import 'core/api/base_url_constant.dart';
import 'flavors/flutter_flavors.dart';
import 'main.dart';

void main() {
  FlavorConfig.initialize(
    const FlavorConfig(
      // baseUrl: 'https://debug.example.com/shahil',
      flavor: Flavor.debug,
      name: 'DEBUG',
    ),
  );

  String api = BaseUrlConstant.getBaseUrl(ApiType.baseUrl);
  logWarning('Calling API: $api');

  runApp(MyApp());
}
