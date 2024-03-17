
import 'package:parity_cube/src/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/constants/route_constants.dart';
import 'routes/fade_page_route_builder.dart';
import 'routes/routes.dart';

class ParityCubeApp extends StatefulWidget {
  const ParityCubeApp({super.key});

  @override
  _ParityCubeAppState createState() => _ParityCubeAppState();
}

class _ParityCubeAppState extends State<ParityCubeApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , ctx) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            title: "My App",
            theme: AppTheme.getAppTheme(context: context),
            initialRoute: RouteList.initial,
            onGenerateRoute: (RouteSettings settings) {
              final routes = Routes.getRoutes(settings);
              final WidgetBuilder? builder = routes[settings.name];
              return FadePageRouteBuilder(
                builder: builder!,
                settings: settings,
              );
            },
          );
        }
    );
  }

}
