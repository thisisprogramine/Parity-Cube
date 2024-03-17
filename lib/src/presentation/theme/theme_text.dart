import 'package:parity_cube/src/config/extension/size_extensions.dart';
import 'package:flutter/material.dart';
import '../../config/constants/size_constants.dart';
import 'theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _varelaRoundTextTheme => const TextTheme();

  static TextStyle? get _displayLarge =>
      _varelaRoundTextTheme.displayLarge?.copyWith(
        fontSize: Sizes.dimen_72.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _displayMedium =>
      _varelaRoundTextTheme.displayMedium?.copyWith(
        fontSize: Sizes.dimen_60.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _displaySmall =>
      _varelaRoundTextTheme.displaySmall?.copyWith(
        fontSize: Sizes.dimen_48.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _headlineLarge =>
      _varelaRoundTextTheme.headlineLarge?.copyWith(
        fontSize: Sizes.dimen_36.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _headlineMedium =>
      _varelaRoundTextTheme.headlineMedium?.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _headlineSmall =>
      _varelaRoundTextTheme.headlineSmall?.copyWith(
        fontSize: Sizes.dimen_21.sp,
        color: AppColor.vulcan,
      );

  static TextStyle? get _titleLarge =>
      _varelaRoundTextTheme.titleLarge?.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _titleMedium =>
      _varelaRoundTextTheme.titleMedium?.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _titleSmall =>
      _varelaRoundTextTheme.headline6?.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodyLarge =>
      _varelaRoundTextTheme.bodyLarge?.copyWith(
        fontSize: Sizes.dimen_12.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodyMedium =>
      _varelaRoundTextTheme.bodyMedium?.copyWith(
        fontSize: Sizes.dimen_11.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodySmall =>
      _varelaRoundTextTheme.bodySmall?.copyWith(
        fontSize: Sizes.dimen_10.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelLarge =>
      _varelaRoundTextTheme.labelLarge?.copyWith(
        fontSize: Sizes.dimen_9.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelMedium =>
      _varelaRoundTextTheme.labelMedium?.copyWith(
        fontSize: Sizes.dimen_8.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelSmall =>
      _varelaRoundTextTheme.labelSmall?.copyWith(
        fontSize: Sizes.dimen_6.sp,
        color: AppColor.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        headlineLarge: _headlineLarge,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelMedium: _labelMedium,
        labelSmall: _labelSmall,
      );

}

extension ThemeTextExtension on TextTheme {
  TextStyle? get greyCaption => subtitle1?.copyWith(color: AppColor.grey, fontSize: Sizes.dimen_14.sp);

  TextStyle? get buttonStyle => button?.copyWith(color: AppColor.surface, fontSize: Sizes.dimen_22.sp);
}
