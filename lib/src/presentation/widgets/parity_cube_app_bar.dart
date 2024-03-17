import 'dart:io';

import 'package:parity_cube/src/config/extension/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class ParityCubeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool elevation;
  final String? title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  const ParityCubeAppBar({super.key, this.elevation = true, this.title, this.leading, this.actions, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ? 1.0 : 0.0,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: Platform.isIOS,
      title: title != null
          ? Text(
              title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
            )
          : Icon(Icons.abc, size: Sizes.dimen_32.h),
      leading: leading ??
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
