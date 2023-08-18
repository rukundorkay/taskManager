import 'package:flutter/material.dart';
import 'package:taskmanager/core/utils/style.dart';

/// An extension that provide additional functionalities to [BuildContext].
extension BuildContextExtension on BuildContext {
  /// Colors that are part of the App's design system.
  AppColors get colors => AppStyles.colors;

  /// The size of the device's screen.
  Size get screenSize => MediaQuery.of(this).size;

  /// A shorcut to get inherited widgets from context.
  ///
  /// This is an alternative to the `T.of(context)` static method which is
  /// usually declared inside all classes that implement [InheritedWidget].
  T provide<T extends InheritedWidget>() {
    final dep = dependOnInheritedWidgetOfExactType<T>();
    assert(dep != null, 'No $T object found in the context.');
    return dep!;
  }

  /// Gets Theme from context.
  ThemeData get theme => Theme.of(this);

  /// Gets [TextTheme] from context.
  TextTheme get textTheme => theme.textTheme;
}
