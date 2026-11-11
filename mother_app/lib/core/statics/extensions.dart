import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String toTitleCase() {
    return split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  String toSentenceCase() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

extension DateTimeFormatting on DateTime {
  /// Returns a clean formatted string containing hour, minute, and AM/PM.
  /// Example: 04:15 PM
  String get toTimeString {
    // 'hh' = 12-hour clock with leading zero (04)
    // 'mm' = minutes with leading zero (15)
    // 'a'  = AM/PM marker
    return DateFormat('hh:mm a').format(this);
  }

  /// Returns a compact formatted string without leading zeros for the hour.
  /// Example: 4:15 PM
  String get toShortTimeString {
    return DateFormat('h:mm a').format(this);
  }

  String get toDateString {
    return DateFormat('dd/MM/yyyy').format(this); // e.g., "24/07/2026"
  }
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension WindowController on BuildContext {
  double get sw => MediaQuery.of(this).size.width;
  double get sh => MediaQuery.of(this).size.height;
  bool get isMobile => sw <= 360;
}

extension EitherUnwrap<L, R> on Either<L, R> {
  /// Returns true if this is a Left
  bool get isLeft => fold((_) => true, (_) => false);

  /// Returns true if this is a Right
  bool get isRight => fold((_) => false, (_) => true);

  /// Gets the Left value directly, throws if it's a Right
  L getLeft() => fold(
    (l) => l,
    (_) => throw Exception('Called getLeft() on a Right value'),
  );

  /// Gets the Right value directly, throws if it's a Left
  R getRight() => fold(
    (_) => throw Exception('Called getRight() on a Left value'),
    (r) => r,
  );
}
