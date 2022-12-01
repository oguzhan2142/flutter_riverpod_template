import 'package:flutter/widgets.dart';

import '../../features/auth/screen/login_screen.dart';
import '../../features/auth/screen/register_screen.dart';
import '../../features/main/screen/main_screen.dart';
import 'routes.dart';

class RouteManager {
  static final RouteManager instance = RouteManager._();
  RouteManager._();

  late final String initialRoute;

  final Map<String, Widget Function(BuildContext)> routes = {
    Routes.LOGIN: (p0) => const LoginScreen(),
    Routes.REGISTER: (p0) => const RegisterScreen(),
    Routes.MAIN: (p0) => MainScreen(),
  };

  void setInitialRoute(bool initializedFromCache) {
    initialRoute = initializedFromCache ? Routes.MAIN : Routes.LOGIN;
  }
}
