import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors - Updated from Style Guide
  // Blue Gradient Colors
  static const Color blueGradientStart = Color(0xFF3288F2);
  static const Color blueGradientEnd = Color(0xFF2404FB);

  // Green Gradient Colors
  //static const Color  greenGradientStart = Color(0xFF6BCB77);//0xFF10B981
  //static const Color greenGradientEnd = Color(0xFF10B981); //Color(0xFF059669)

  static const Color  greenGradientStart = Color(0xFF6BCB77);//
  static const Color greenGradientEnd = Color(0xFF059669); //Color()
  
  

  // Primary Colors
  static const Color primaryBlue = Color(
    0xFF2404FB,
  ); // Using gradient start as primary
  static const Color lightBlue = Color(0xFF3288F2);
  static const Color lightBlueBackground = Color(0xFFE3EDFC);

  // Accent Colors
  static const Color green = Color(0xFF6BCB77);
  static const Color orange = Color(0xFFFFB700);

  // Text Colors
  static const Color textDarkGray = Color(0xFF333333);
  static const Color textLightGray = Color(0xFFF4F4F4);
  static const Color textMediumBlue = Color(0xFF778FC2);
  static const Color textMediumBlueDark = Color(0xFF687EC5);
  static const Color textGrayTime = Colors.grey;

  // Utility Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellowTag = Color(
    0xFFFFB700,
  ); // Using orange as yellow alternative
  static const Color greenOnline = Color(0xFF6BCB77);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textDarkGray,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlue,
          side: const BorderSide(color: primaryBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: textLightGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: textLightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
