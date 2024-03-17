
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:parity_cube/src/config/extension/size_extensions.dart';

import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Sizes.dimen_160.h,
        height: Sizes.dimen_160.h,
        child: const FlareActor(
          'assets/animations/loading_circle.flr',
          animation: 'load',
          snapToEnd: true,
          color: AppColor.purple,
        ),
      ),
    );
  }
}
