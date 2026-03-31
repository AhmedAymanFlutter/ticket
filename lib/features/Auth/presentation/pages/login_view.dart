import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/core/widgets/custom_text_field.dart';
import 'package:ticket/features/auth/presentation/pages/widgets/PhoneFieldWithCountryPicker_widget.dart';
import 'package:ticket/features/auth/presentation/pages/widgets/social_section_widgets.dart';
import 'package:ticket/features/auth/presentation/pages/forget_password_view.dart';
import 'package:ticket/features/home/home.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ticket/core/widgets/custom_snackbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+966'; // Default for SA

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
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),

                      PhoneFieldWithCountryPicker(
                        controller: _phoneController,
                        initialCountryCode: 'SA',
                        onCountryChanged: (code) {
                          setState(() {
                            _selectedCountryCode = code.dialCode ?? '+966';
                          });
                        },
                      ),
                      SizedBox(height: 12.h),

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

                      SizedBox(height: 24.h),

                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            context.showSuccessSnackBar(state.response.message);
                            FadeNavigation.pushFromBottom(
                              context,
                              const Home(),
                            );
                          } else if (state is AuthError) {
                            context.showErrorSnackBar(state.message);
                          }
                        },
                        builder: (context, state) {
                          return CustomGradientButton(
                            text: state is AuthLoading
                                ? 'auth.loading'.tr()
                                : 'auth.login'.tr(),
                            onPressed: () {
                              if (state is AuthLoading) return;
                              if (_formKey.currentState!.validate()) {
                                final loginRequest = LoginRequestModel(
                                  phone: _phoneController.text,
                                  countryCode: _selectedCountryCode,
                                  password: _passwordController.text,
                                );
                                context.read<AuthCubit>().login(loginRequest);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16.h),

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
                      SizedBox(height: 16.h),

                      // Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildSocialButton(Icons.apple, Colors.black),
                          SizedBox(width: 16.w),
                          buildSocialButton(
                            null,
                            Colors.white,
                            onTap: () {
                              context.read<AuthCubit>().signInWithGoogle();
                            },
                            child: Image.asset(
                              'assets/icons/google.png',
                              width: 24.w,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          buildSocialButton(
                            null,
                            const Color(0xFF1877F2),
                            onTap: () {
                              context.read<AuthCubit>().signInWithFacebook();
                            },
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

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
                      SizedBox(height: 16.h),
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
