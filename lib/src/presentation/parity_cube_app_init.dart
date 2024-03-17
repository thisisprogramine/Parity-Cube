


import 'package:parity_cube/src/config/extension/size_extensions.dart';
import 'package:flutter/material.dart';

import '../config/constants/route_constants.dart';
import '../config/constants/size_constants.dart';
import 'theme/theme_color.dart';
import 'widgets/logo.dart';

class ParityCubeAppInit extends StatefulWidget {
  const ParityCubeAppInit({Key? key}) : super(key: key);
  @override
  State<ParityCubeAppInit> createState() => _ParityCubeAppInitState();
}

class _ParityCubeAppInitState extends State<ParityCubeAppInit> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteList.home,
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.dimen_20.h, horizontal: Sizes.dimen_20.w),
          child: const Center(
            child: Logo(
              isDark: true,
            ),
          ),
        )
    );
  }
}
