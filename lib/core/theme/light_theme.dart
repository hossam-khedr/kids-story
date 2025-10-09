import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_story_ai/core/utils/responsive_helper.dart';

import '../constants/app_colors.dart';
class LightTheme {
  static ThemeData get theme {
    return ThemeData(

      useMaterial3: true,
      brightness: Brightness.light,


      primaryColor: AppColors.primary,
     // primaryColorLight: AppColors.primaryLight,
     // primaryColorDark: AppColors.primaryDark,

      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.whit,
      canvasColor: AppColors.whit,

      // colorScheme: ColorScheme.light(
      //   primary: AppColors.primary,
      //   secondary: AppColors.secondary,
      //   error: AppColors.error,
      //   background: AppColors.background,
      //   surface: AppColors.white,
      //   onPrimary: AppColors.white,
      //   onSecondary: AppColors.white,
      //   onError: AppColors.white,
      //   onBackground: AppColors.textPrimary,
      //   onSurface: AppColors.textPrimary,
      // ),

      // ===== AppBar =====
      appBarTheme: AppBarTheme(
       // backgroundColor: AppColors.primary,
        //foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.whit,
          size: 24,
        ),
        // titleTextStyle: TextStyle(
        //   color: AppColors.whit,
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        //
        // ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // ===== Text Theme =====
      textTheme: TextTheme(
        // Display
        displayLarge: TextStyle(
          fontSize: ResponsiveHelper.r.font(25),
          fontWeight: FontWeight.w500,
          color: AppColors.whit,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),

        // Headline
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),

        // Title
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        titleMedium: TextStyle(
          fontSize: ResponsiveHelper.r.font(14),
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        titleSmall: TextStyle(
          fontSize: ResponsiveHelper.r.font(14),
          fontWeight: FontWeight.w400,
          color: AppColors.whit,
        ),

        // Body
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.foreground,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.foreground,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.foreground,
        ),

        // Label
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.foreground,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
      ),

      // ===== Icon Theme =====
      // iconTheme: IconThemeData(
      //   color: AppColors.textPrimary,
      //   size: 24,
      // ),

      // ===== Button Themes =====
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.primary,
      //     foregroundColor: AppColors.white,
      //     elevation: 2,
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),

      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //     foregroundColor: AppColors.primary,
      //     side: BorderSide(color: AppColors.primary, width: 2),
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding:  ResponsiveHelper.r.paddingSymmetric(horizontal: 8, vertical: 8),
          textStyle:  TextStyle(
            fontSize: ResponsiveHelper.r.font(14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // ===== Input Decoration =====
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: AppColors.grey.withOpacity(0.1),
        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 16,
        //   vertical: 14,
        // ),

        // Border
        // border: OutlineInputBorder(
        //   // borderRadius: BorderRadius.circular(12),
        //   // borderSide: BorderSide(color: AppColors.primary),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),

        // Text Styles
        // labelStyle: TextStyle(
        //   color: AppColors.textSecondary,
        //   fontSize: 14,
        // ),
        // hintStyle: TextStyle(
        //   color: AppColors.textSecondary.withOpacity(0.6),
        //   fontSize: 14,
        // ),
        // errorStyle: TextStyle(
        //   color: AppColors.error,
        //   fontSize: 12,
        // ),

        // Icons
        // prefixIconColor: AppColors.textSecondary,
        // suffixIconColor: AppColors.textSecondary,
      ),

      // ===== Card Theme =====
      cardTheme: CardThemeData(
        color: AppColors.whit,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // ===== Dialog Theme =====
      // dialogTheme: DialogThemeData(
      //   backgroundColor: AppColors.white,
      //   elevation: 8,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   titleTextStyle: TextStyle(
      //     color: AppColors.textPrimary,
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   contentTextStyle: TextStyle(
      //     color: AppColors.textPrimary,
      //     fontSize: 16,
      //   ),
      // ),
      //
      // // ===== Bottom Sheet Theme =====
      // bottomSheetTheme: BottomSheetThemeData(
      //   backgroundColor: AppColors.white,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(24),
      //     ),
      //   ),
      //   elevation: 8,
      // ),
      //
      // // ===== Divider Theme =====
      // dividerTheme: DividerThemeData(
      //   color: AppColors.grey.withOpacity(0.2),
      //   thickness: 1,
      //   space: 1,
      // ),
      //
      // // ===== Chip Theme =====
      // chipTheme: ChipThemeData(
      //   backgroundColor: AppColors.grey.withOpacity(0.1),
      //   selectedColor: AppColors.primary.withOpacity(0.2),
      //   deleteIconColor: AppColors.textSecondary,
      //   labelStyle: TextStyle(
      //     color: AppColors.textPrimary,
      //     fontSize: 14,
      //   ),
      //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),
      //
      // // ===== BottomNavigationBar Theme =====
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: AppColors.white,
      //   selectedItemColor: AppColors.primary,
      //   unselectedItemColor: AppColors.textSecondary,
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 8,
      //   selectedLabelStyle: const TextStyle(
      //     fontSize: 12,
      //     fontWeight: FontWeight.w600,
      //   ),
      //   unselectedLabelStyle: const TextStyle(
      //     fontSize: 12,
      //     fontWeight: FontWeight.w400,
      //   ),
      // ),
      //
      // // ===== FloatingActionButton Theme =====
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //   backgroundColor: AppColors.primary,
      //   foregroundColor: AppColors.white,
      //   elevation: 4,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16),
      //   ),
      // ),
      //
      // // ===== SnackBar Theme =====
      // snackBarTheme: SnackBarThemeData(
      //   backgroundColor: AppColors.textPrimary,
      //   contentTextStyle: TextStyle(
      //     color: AppColors.white,
      //     fontSize: 14,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   behavior: SnackBarBehavior.floating,
      // ),
      //
      // // ===== Switch Theme =====
      // switchTheme: SwitchThemeData(
      //   thumbColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return AppColors.white;
      //     }
      //     return AppColors.grey;
      //   }),
      //   trackColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return AppColors.primary;
      //     }
      //     return AppColors.grey.withOpacity(0.5);
      //   }),
      // ),
      //
      // // ===== Checkbox Theme =====
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateProperty.resolveWith((states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return AppColors.primary;
      //     }
      //     return Colors.transparent;
      //   }),
      //   checkColor: WidgetStateProperty.all(AppColors.white),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(4),
      //   ),
      // ),
      //
      // // ===== Radio Theme =====
      // radioTheme: RadioThemeData(
      //   fillColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return AppColors.primary;
      //     }
      //     return AppColors.grey;
      //   }),
      // ),
      //
      // // ===== Progress Indicator Theme =====
      // progressIndicatorTheme: ProgressIndicatorThemeData(
      //   color: AppColors.primary,
      //   linearTrackColor: AppColors.grey.withOpacity(0.2),
      // ),
    );
  }
}