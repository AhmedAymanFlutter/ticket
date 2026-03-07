import 'package:easy_localization/easy_localization.dart';
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
      barrierLabel: 'exit_dialog.title'.tr(),
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Center(
            child: Dialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// 🔴 Icon
                    Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.brandSecondary.withOpacity(0.12),
                      ),
                      child: Icon(
                        Icons.logout_rounded,
                        color: AppColors.brandSecondary,
                        size: 36.sp,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// 📝 Title
                    Text(
                      'exit_dialog.title'.tr(),
                      style: AppTextStyle.heading3.copyWith(
                        color: AppColors.brandPrimary,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    /// 📄 Description
                    Text(
                      'exit_dialog.message'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    /// 🔘 Buttons
                    Row(
                      children: [
                        /// Cancel
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.lightGray),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'exit_dialog.cancel'.tr(),
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 16.w),

                        /// Exit
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.brandPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              elevation: 0,
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text(
                              'exit_dialog.exit'.tr(),
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
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
