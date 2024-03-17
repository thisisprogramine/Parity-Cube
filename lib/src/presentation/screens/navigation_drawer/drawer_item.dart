

import 'package:flutter/material.dart';
import 'package:parity_cube/src/config/extension/size_extensions.dart';

import '../../../config/constants/size_constants.dart';
import '../../../utilities/helper/ui_helper.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_8.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(icon, size: Sizes.dimen_22,),
            UIHelper.horizontalSpace(Sizes.dimen_22.w),
            Text(title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
