import 'package:flutter/material.dart';

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final bool Function(Route route) removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? object}) async {
    await navigatorKey.currentState?.pushNamed(path!, arguments: object);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? object}) async {
   await navigatorKey.currentState?.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: object);
  }
}
