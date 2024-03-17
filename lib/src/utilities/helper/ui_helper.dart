
import 'package:flutter/material.dart';
import 'package:parity_cube/src/config/extension/size_extensions.dart';

import '../../config/constants/size_constants.dart';


class UIHelper {
  UIHelper._();

  static const double _verticalSpaceSmall = Sizes.dimen_8;
  static const double _verticalSpaceMedium = Sizes.dimen_16;
  static const double _verticalSpaceLarge = Sizes.dimen_22;

  // Vertical spacing constants. Adjust to your liking.
  static const double _horizontalSpaceSmall = Sizes.dimen_4;
  static const double _horizontalSpaceMedium = Sizes.dimen_10;
  static const double _horizontalSpaceLarge = Sizes.dimen_22;

  static Widget verticalSpaceSmall =
  SizedBox(height: _verticalSpaceSmall.h);
  static Widget verticalSpaceMedium =
  SizedBox(height: _verticalSpaceMedium.h);
  static Widget verticalSpaceLarge =
  SizedBox(height: _verticalSpaceLarge.h);

  static Widget horizontalSpaceSmall =
  SizedBox(width: _horizontalSpaceSmall.w);
  static Widget horizontalSpaceMedium =
  SizedBox(width: _horizontalSpaceMedium.w);
  static Widget horizontalSpaceLarge =
  SizedBox(width: _horizontalSpaceLarge.w);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);

}
