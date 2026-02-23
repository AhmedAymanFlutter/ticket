import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.isDarkButton = true,
    this.width,
    this.height,
    this.icon = Icons.visibility_outlined,
    this.borderRadius,
    this.gradient,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.fontSize,
    this.fontFamily = 'Madani Arabic',
    this.iconSize,
  });

  final VoidCallback onTap;
  final String buttonText;
  final bool isDarkButton;
  final double? width;
  final double? height;
  final IconData icon;
  final double? borderRadius;

  // Overrides — optional
  final LinearGradient? gradient;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final double? fontSize;
  final String fontFamily;
  final double? iconSize;

  // ── Defaults based on isDarkButton ──────────────────────────────────────
  static const _darkGradient = LinearGradient(
    colors: [Color(0xFF282A50), Color(0xFF373B7F)],
    stops: [0.4087, 0.6779],
  );
  static const _darkColor = Colors.white;
  static const _lightColor = Color(0xFF282A50);

  Color get _resolvedContentColor =>
      textColor ?? (isDarkButton ? _darkColor : _lightColor);

  LinearGradient? get _resolvedGradient =>
      isDarkButton ? (gradient ?? _darkGradient) : null;

  Border? get _resolvedBorder =>
      isDarkButton ? null : Border.all(color: borderColor ?? _lightColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
          border: _resolvedBorder,
          gradient: _resolvedGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? _resolvedContentColor,
              size: iconSize ?? 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              buttonText,
              style: TextStyle(
                color: _resolvedContentColor,
                fontSize: fontSize ?? 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
