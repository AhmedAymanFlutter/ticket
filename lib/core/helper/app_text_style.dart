import 'package:ticket/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text styles using IBM Plex Sans Arabic font
class AppTextStyle {
  // Prevent instantiation
  AppTextStyle._();

  /// Custom text style with IBM Plex Sans Arabic
  static TextStyle _baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Custom text style public accessor
  static TextStyle setTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return _baseStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  // Maintaining old method names for compatibility, but using new font
  static TextStyle setIBMTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) => _baseStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);

  static TextStyle setIBMWhite({
    required double fontSize,
    required FontWeight fontWeight,
  }) => _baseStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.white,
  );

  static TextStyle setIBMPrimaryText({
    required double fontSize,
    required FontWeight fontWeight,
  }) => _baseStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.textPrimary,
  );

  static TextStyle setIBMSecondaryText({
    required double fontSize,
    required FontWeight fontWeight,
  }) => _baseStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.textSecondary,
  );

  // TYPOGRAPHY SCALE (Based on Design System)

  /// Heading 1 - 40px
  static TextStyle get heading1 => _baseStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// Heading 2 - 36px
  static TextStyle get heading2 => _baseStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// Heading 3 - 32px
  static TextStyle get heading3 => _baseStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// Body 1 - 28px
  static TextStyle get body1 => _baseStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  /// Body 2 - 24px
  static TextStyle get body2 => _baseStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  /// Body 3 - 20px
  static TextStyle get body3 => _baseStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  /// Body 4 - 18px (Maps to old bodyRegular)
  static TextStyle get bodyRegular => _baseStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  /// Small Text 1 - 16px (Maps to old bodyMedium)
  static TextStyle get bodyMedium => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  /// Small Text 2 - 14px (Maps to old bodySmall/caption)
  static TextStyle get bodySmall => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle get caption => bodySmall;

  /// Button text
  static TextStyle get button => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // Legacy mappings for compatibility
  static TextStyle get heading4 => heading3; // Fallback
  static TextStyle get setPoppinsLightGray => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.lightGray,
  );
}
