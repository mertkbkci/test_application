import 'package:flutter/material.dart';
import 'package:test_application/303/lottie_learn.dart';
import 'package:test_application/303/navigator/navigate_home_detail_view.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == "/") {
      return _navigateToNormal(const LottieLearn());
    } else if (routeSettings.name == "/homeDetail") {
      final _id = routeSettings.arguments as String?;
      return _navigateToNormal(const NavigateHomeDetailView());
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) {
      return child;
    });
  }
}
