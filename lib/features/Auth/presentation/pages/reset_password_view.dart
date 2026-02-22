import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/core/widgets/custom_text_field.dart';
import 'package:ticket/features/auth/presentation/pages/login_view.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/photo/auth_combonant.png',
              height: 285.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Title "إعادة ضبط كلمة المرور" with arrow on top of image
          Positioned(
            top: 140.h,
            right: 24.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'auth.reset_password'.tr(), // "إعادة ضبط كلمة المرور"
                  style: AppTextStyle.heading4.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),

          // White Card Container (overlapping image)
          Positioned(
            top: 199.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),

                      // Password Field
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'auth.new_password'
                            .tr(), // "كلمة المرور الجديدة"
                        obscureText: true,
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Confirm Button
                      CustomGradientButton(
                        text: 'auth.confirm'.tr(), // "تأكيد"
                        onPressed: () {
                          // Update Password Logic here

                          // Show Success Dialog
                          _showSuccessDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with glow
              Container(
                width: 108.w,
                height: 108.h,
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF1D884B),
                      Color.fromRGBO(188, 230, 206, 0.6),
                    ],
                    center: Alignment.center,
                    radius: 0.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/done.svg',
                    width: 56.w,
                    height: 56.h,
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Title
              Text(
                'auth.password_changed_success_title'.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyle.heading3.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 12.h),

              // Description
              Text(
                'auth.password_changed_success_desc'.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyRegular.copyWith(
                  color: const Color(0xFF0E0F11),
                  fontSize: 14.sp,
                  // height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              // Login Button
              CustomGradientButton(
                text: 'auth.login'.tr(),
                onPressed: () {
                  FadeNavigation.pushFromBottom(context, const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
