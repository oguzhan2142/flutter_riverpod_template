import 'package:education_social_platform_app/global/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/cache/cache_manager.dart';
import 'global/model/auth.dart';
import 'global/route/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  CacheManager.instance.init(prefs);
  bool isAuthSuccess = await Auth.initFromLocal();
  if (!isAuthSuccess) {
    Auth.getInstance()?.removeFromPrefs();
  }
  RouteManager.instance.setInitialRoute(isAuthSuccess);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.instance.lightTheme,
      initialRoute: RouteManager.instance.initialRoute,
      routes: RouteManager.instance.routes,
    );
  }
}
