import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/core/widgets/custom_text_field.dart';
import 'package:ticket/features/Auth/presentation/pages/widgets/PhoneFieldWithCountryPicker_widget.dart';
import 'package:ticket/features/Auth/presentation/pages/widgets/social_section_widgets.dart';
import 'package:ticket/features/Auth/presentation/pages/forget_password_view.dart';
import 'package:ticket/features/home/home.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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

          // Title "تسجيل الدخول" with arrow on top of image
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
                  'auth.login'.tr(),
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

                      PhoneFieldWithCountryPicker(
                        controller: _phoneController,
                        initialCountryCode: 'SA',
                        onCountryChanged: (code) {
                          print(code.dialCode);
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Password Field
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'auth.password'.tr(),
                        obscureText: true,
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey[600],
                        ),
                      ),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            FadeNavigation.pushFade(
                              context,
                              const ForgetPasswordView(),
                            );
                          },
                          child: Text(
                            'auth.forget_password'.tr(),
                            style: AppTextStyle.bodyRegular.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 32.h),

                      CustomGradientButton(
                        text: 'auth.login'.tr(),
                        onPressed: () {
                          FadeNavigation.pushScale(context, const Home());
                        },
                      ),
                      SizedBox(height: 24.h),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'auth.or'.tr(),
                              style: AppTextStyle.bodyRegular.copyWith(
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildSocialButton(Icons.apple, Colors.black),
                          SizedBox(width: 16.w),
                          buildSocialButton(
                            null,
                            Colors.white,
                            child: Image.asset(
                              'assets/icons/google.png',
                              width: 24.w,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          buildSocialButton(
                            null,
                            const Color(0xFF1877F2),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Bottom Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'auth.dont_have_account'.tr(),
                              style: AppTextStyle.bodyRegular.copyWith(
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'auth.signup'.tr(),
                              style: AppTextStyle.bodyRegular.copyWith(
                                color: const Color(0xFF282A51),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
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
}
