import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utilities/app_logger.dart';

class NavigationObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    appLogger.d('New route pushed: ${route.settings.name}');
    appLogger.d('Previous route: ${previousRoute?.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    appLogger.d('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    appLogger.d('Tab route re-visited: ${route.name}');
  }
}
