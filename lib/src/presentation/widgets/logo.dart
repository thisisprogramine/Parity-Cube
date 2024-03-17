
import 'package:parity_cube/src/config/extension/size_extensions.dart';
import 'package:flutter/material.dart';
import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class Logo extends StatelessWidget {
  final double height;
  final bool isDark;

  const Logo({
    Key? key,
    this.height = 20,
    this.isDark = false,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h, horizontal: Sizes.dimen_12.w),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Icon(Icons.abc, size: Sizes.dimen_80.w, color: AppColor.white,),
          ),
        ],
      ),
    );
  }
}
