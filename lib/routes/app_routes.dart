import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:FeatureRichArchFlutter/features/authentication_screen/view/auth_page.dart';
import 'package:FeatureRichArchFlutter/features/home_screen/view/home_screen.dart';
import 'package:FeatureRichArchFlutter/features/landing_screen/landing_page.dart';
import 'package:FeatureRichArchFlutter/features/navigation_screen/navigation_page.dart';
import 'package:FeatureRichArchFlutter/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name!);

    logInfo(uri);

    switch (uri.path) {
      case SplashScreen.path:
        return pageRoute(
          settings,
          const SplashScreen(),
        );

      case LandingPage.path:
        return pageRoute(
          settings,
          const LandingPage(),
        );

      case AuthPage.path:
        return PageTransition(
          childCurrent: const LandingPage(),
          type: PageTransitionType.sharedAxisHorizontal,
          child: AuthPage(),
          duration: const Duration(milliseconds: 400),
        );
      case NavigationPage.path:
        return pageRoute(
          settings,
          const NavigationPage(),
        );
      // case AuthPage.path:
      //   return pageRoute(settings, const AuthPage());

      case HomeScreen.path:
        return pageRoute(
          settings,
          const HomeScreen(),
        );
      default:
        return null;
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoute(String path) {
    Uri uri = Uri.parse(path);

    logInfo(uri);

    return [
      pageRoute(
        const RouteSettings(name: LandingPage.path),
        const SplashScreen(),
      ),
    ];
  }

  static Route<T> pageRoute<T>(
    RouteSettings settings,
    Widget screen, {
    bool animate = true,
  }) {
    if (!animate) {
      return PageRouteBuilder(
        settings: settings,
        opaque: true,
        pageBuilder: (context, animation, secondaryAnimation) => screen,
      );
    }
    return MaterialPageRoute(settings: settings, builder: (context) => screen);
  }
}
