import 'package:mother_app/core/statics/AppConstants.dart';
import 'package:mother_app/core/theme/themeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // General theme
    brightness: Brightness.light,

    // THIS BLOCK IS FOR LIGHT THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBar,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, // ⬛ Black icons for light mode
        statusBarBrightness: Brightness.light, // Required for iOS light mode
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),

    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    disabledColor: AppColors.disableColor,

    shadowColor: AppColors.shadow,

    // Color Scheme
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      // primaryFixedDim: AppColors.primaryDark,
      onPrimaryFixedVariant: AppColors.primaryBright,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onInverseSurface,
      surfaceBright: AppColors.surfaceBright,
      // to be added to dark mode
      // surfaceContainer: const Color.fromARGB(255, 19, 97, 193),
    ),

    fontFamily: inter,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.titleColor,
        // fontFamily: alegreyaSans,
        fontSize: 57,
      ),
      displayMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 45,
        fontWeight: FontWeight.w500,
        // fontFamily: alegreyaSans,
      ),
      displaySmall: TextStyle(
        color: AppColors.titleColor,
        fontSize: 36,
        fontWeight: FontWeight.w500,
        // fontFamily: alegreyaSans,
      ),

      headlineLarge: TextStyle(fontSize: 32, color: AppColors.titleColor),
      headlineMedium: TextStyle(fontSize: 28, color: AppColors.titleColor),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: AppColors.titleColor,
        fontWeight: FontWeight.w500,
      ),

      titleLarge: TextStyle(
        color: AppColors.titleColor,
        // fontFamily: alegreyaSans,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        // fontFamily: alegreyaSans,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.titleColor,
        // fontFamily: alegreyaSans,
        fontWeight: FontWeight.w500,
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.labelColor,
        fontSize: 14,
      ),
      labelMedium: TextStyle(color: AppColors.labelColor, fontSize: 12),
      labelSmall: TextStyle(color: AppColors.labelColor, fontSize: 11),

      //AppColors.bodyColor
      bodyLarge: TextStyle(color: AppColors.bodyColor, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.bodyColor, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.bodyColor, fontSize: 12),
    ),

    // Must be added to dark mode
    searchBarTheme: SearchBarThemeData(
      overlayColor: AppColors.overlayColor,
      shadowColor: WidgetStatePropertyAll(Colors.transparent),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.disableColor,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          height: 1.1,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.bodyColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.3,
        ),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.surface),
        overlayColor: AppColors.overlayColor,
        padding: WidgetStateProperty.all(EdgeInsets.all(5)),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // 1. Core design properties
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),

        // THE BULLETPROOF FIX: Maps the padding directly, ignoring the styleFrom structural calculation error
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),

        // Force zero-constraints on the raw canvas layers
        minimumSize: WidgetStateProperty.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      splashRadius: 0,
      overlayColor: MaterialStateProperty.resolveWith(
        (_) => Colors.transparent,
      ),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 👈 tile radius
      ),
      selectedTileColor: Colors.blue.withOpacity(0.12),
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.onInverseSurface.withOpacity(0.2),
    ),
  );

  // ThemeData darkTheme = ThemeData(
  //   // General theme
  //   brightness: Brightness.dark,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: AppColors.appBarDark,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness:
  //           Brightness.light, // ⬜ White icons for dark mode
  //       statusBarBrightness: Brightness.dark, // Required for iOS dark mode
  //       systemNavigationBarColor: Colors.transparent,
  //       systemNavigationBarIconBrightness: Brightness.light,
  //     ),
  //   ),

  //   primaryColor: AppColors.primary,
  //   scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
  //   disabledColor: AppColors.disableColorDark,

  //   // Color Scheme
  //   colorScheme: ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: AppColors.primary,
  //     onPrimary: AppColors.onPrimary,
  //     secondary: AppColors.secondary,
  //     onSecondary: AppColors.onSecondary,
  //     tertiary: AppColors.tertiary,
  //     onTertiary: AppColors.onTertiary,
  //     error: AppColors.error,
  //     onError: AppColors.onError,
  //     surface: AppColors.onInverseSurfaceDark,
  //     onSurface: AppColors.surfaceDark,
  //     inverseSurface: AppColors.surfaceDark,
  //     onInverseSurface: AppColors.onInverseSurfaceDark,
  //   ),

  //   fontFamily: 'Poppins',
  //   textTheme: const TextTheme(
  //     headlineLarge: TextStyle(color: AppColors.titleColorDark),
  //     headlineMedium: TextStyle(color: AppColors.titleColorDark),
  //     headlineSmall: TextStyle(color: AppColors.titleColorDark),

  //     displayLarge: TextStyle(
  //       color: AppColors.titleColorDark,
  //       fontSize: 31,
  //       fontWeight: FontWeight.w300,
  //     ),
  //     displayMedium: TextStyle(
  //       color: AppColors.titleColorDarkLow,
  //       fontSize: 19,
  //       fontWeight: FontWeight.w300,
  //     ),
  //     displaySmall: TextStyle(
  //       color: AppColors.titleColorDark,
  //       fontSize: 35,
  //       fontWeight: FontWeight.w300,
  //     ),

  //     titleLarge: TextStyle(color: AppColors.titleColorDark),
  //     titleMedium: TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.w600,
  //       color: AppColors.primary,
  //     ),
  //     titleSmall: TextStyle(color: AppColors.titleColorDark),

  //     labelLarge: TextStyle(
  //       fontWeight: FontWeight.w500,
  //       letterSpacing: 0.1,
  //       color: AppColors.labelColorDark,
  //     ),
  //     labelMedium: TextStyle(color: AppColors.labelColorDark),
  //     labelSmall: TextStyle(color: AppColors.labelColorDark),

  //     bodyLarge: TextStyle(color: AppColors.bodyColorDark),
  //     bodyMedium: TextStyle(color: AppColors.bodyColorDark),
  //     bodySmall: TextStyle(color: AppColors.bodyColorDark),
  //   ),
  // );
}

// Standard Formats
// displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
// displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
// displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),

// headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
// headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
// headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),

// titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
// titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

// bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
// bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
// bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

// labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
// labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
// labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
