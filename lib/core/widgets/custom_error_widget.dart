import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/helper/app_text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final String? illustrationPath;

  const CustomErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.illustrationPath,
  });

  @override
  Widget build(BuildContext context) {
    // Determine which illustration to show based on the message
    String assetPath = illustrationPath ?? 'assets/photo/request_timeout.png';

    // Simplistic check for timeout vs other errors
    if (message.toLowerCase().contains('timeout')) {
      assetPath = 'assets/photo/request_timeout.png';
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxHeight < 300.h;
        final bool isVerySmall = constraints.maxHeight < 150.h;

        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isVerySmall) ...[
                    // 3D Illustration
                    Image.asset(
                      assetPath,
                      width: isSmall ? 100.w : 200.w,
                      height: isSmall ? 100.h : 200.h,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.cloud_off_rounded,
                          size: isSmall ? 40.sp : 80.sp,
                          color: AppColors.brandSecondary.withOpacity(0.5),
                        );
                      },
                    ),
                    SizedBox(height: isSmall ? 12.h : 24.h),
                  ],

                  // Error Message
                  Text(
                    message.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.setTextStyle(
                      fontSize: isSmall ? 16 : 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: isSmall ? 8.h : 12.h),

                  if (!isSmall) ...[
                    // Subtitle / User Guidance
                    Text(
                      'errors.try_again_desc'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.setTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],

                  // Retry Button
                  GestureDetector(
                    onTap: onRetry,
                    child: Container(
                      width: isSmall ? 120.w : 160.w,
                      height: isSmall ? 40.h : 48.h,
                      decoration: BoxDecoration(
                        gradient: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFE406F).withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'errors.retry'.tr(),
                          style: AppTextStyle.setTextStyle(
                            fontSize: isSmall ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
