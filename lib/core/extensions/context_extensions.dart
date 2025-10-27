import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Theme Extensions
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Text Style Extensions
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;

  // Color Extensions
  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get backgroundColor => colorScheme.background;
  Color get surfaceColor => colorScheme.surface;
  Color get errorColor => colorScheme.error;

  // Screen Size Extensions
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;

  // Responsive Extensions
  bool get isSmallScreen => screenWidth < 600;
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1200;
  bool get isLargeScreen => screenWidth >= 1200;

  // Padding Extensions
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  // Navigation Extensions
  NavigatorState get navigator => Navigator.of(this);

  void pop<T>([T? result]) => navigator.pop(result);

  Future<T?> push<T>(Widget page) {
    return navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacement<T, TO>(Widget page, {TO? result}) {
    return navigator.pushReplacement<T, TO>(MaterialPageRoute(builder: (_) => page), result: result);
  }

  Future<T?> pushReplacementNamed<T, TO>(String routeName, {TO? result, Object? arguments}) {
    return navigator.pushReplacementNamed<T, TO>(routeName, result: result, arguments: arguments);
  }

  void pushAndRemoveUntil(Widget page, bool Function(Route<dynamic>) predicate) {
    navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), predicate);
  }

  void pushNamedAndRemoveUntil(String routeName, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    navigator.pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  // Snackbar Extensions
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: duration, action: action, backgroundColor: backgroundColor),
    );
  }

  void showSuccessSnackBar(String message) {
    showSnackBar(message, backgroundColor: Colors.green);
  }

  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: errorColor);
  }

  // Dialog Extensions
  Future<T?> showCustomDialog<T>({required Widget child, bool barrierDismissible = true}) {
    return showDialog<T>(context: this, barrierDismissible: barrierDismissible, builder: (_) => child);
  }

  // Keyboard Extensions
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}
