import 'package:flutter/material.dart';

/// Utility class that helps to access the colors used in the Pozo delivery app.
class AppColors {
  AppColors._();

  /// White color.
  final Color primary = const Color(0xff03284C);

  /// Bacl Color
  final Color secondary = const Color(0xff000000);
}

/// A utility class that holds all global styling properties used in the app.
class AppStyles {
  AppStyles._();

  /// An object that holds all the colors used in the app.
  static AppColors get colors => AppColors._();

  /// Global border radius.
  static const double radius = 12;

  /// Smallest padding/margin value.
  static const double spaceTiny = 8;

  /// Small padding/margin value.
  static const double spaceSmall = 12;

  /// Main padding/margin value.
  static const double spaceDefault = 16;

  /// Medium padding/margin value.
  static const double spaceMedium = 24;

  /// A large padding/margin value.
  static const double spaceLarge = 32;

  /// A Huge padding/margin value.
  static const double spaceHuge = 36;

  /// Enormous padding/margin value.
  static const double spaceEnormous = 40;

  ///inputSize
  static const double textinputSize = 60;

  /// screen width

}
