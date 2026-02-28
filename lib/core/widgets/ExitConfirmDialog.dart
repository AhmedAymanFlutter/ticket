import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';

class ExitConfirmDialog {
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Exit',
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Center(
            child: Dialog(
              backgroundColor: AppColors.brandPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// 🔴 Icon
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.brandPrimary.withOpacity(0.12),
                      ),
                      child: Icon(
                        Icons.exit_to_app_rounded,
                        color: AppColors.brandPrimary,
                        size: 32.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    /// 📝 Title
                    Text(
                      'Exit App',
                      style: AppTextStyle.setIBMTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.brandPrimary,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    /// 📄 Description
                    Text(
                      'Are you sure you want to exit the application?',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.setIBMTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.brandPrimary,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    /// 🔘 Buttons
                    Row(
                      children: [
                        /// Cancel
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.darkGray),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: AppTextStyle.setIBMTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        /// Exit
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.brandPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              elevation: 0,
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text(
                              'Exit',
                              style: AppTextStyle.setIBMTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }
}
