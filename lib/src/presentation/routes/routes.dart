

import 'package:flutter/material.dart';

import '../../config/constants/route_constants.dart';
import '../parity_cube_app_init.dart';
import '../screens/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const ParityCubeAppInit(),
        RouteList.home: (context) => const HomeScreen(),
      };
}
