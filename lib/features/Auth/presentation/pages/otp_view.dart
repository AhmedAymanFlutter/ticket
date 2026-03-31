import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/features/auth/presentation/pages/reset_password_view.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';

class OtpView extends StatefulWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xFF282A51);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: AppTextStyle.heading3.copyWith(
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.r),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthOtpVerified) {
            FadeNavigation.pushSlide(
              context,
              ResetPasswordView(
                email: widget.email,
                otp: _pinController.text,
                resetToken: state.resetToken,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
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

              // Title "تأكيد البريد الإلكتروني" with arrow on top of image
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
                      'auth.confirm_email'.tr(),
                      style: AppTextStyle.heading4.copyWith(
                        color: Colors.white,
                      ),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 16.h),
                          // Helper Text
                          Text(
                            'auth.enter_otp_sent_email'.tr(),
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyRegular.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Pinput Widget
                          Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: Pinput(
                              controller: _pinController,
                              focusNode: _focusNode,
                              length: 6,
                              defaultPinTheme: defaultPinTheme,
                              separatorBuilder: (index) => SizedBox(width: 8.w),
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'auth.invalid_otp'.tr();
                                }
                                return null;
                              },
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 22,
                                    height: 1,
                                    color: focusedBorderColor,
                                  ),
                                ],
                              ),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: focusedBorderColor,
                                      ),
                                    ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                      color: fillColor,
                                      borderRadius: BorderRadius.circular(19.r),
                                      border: Border.all(
                                        color: focusedBorderColor,
                                      ),
                                    ),
                              ),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // Resend Code
                          Container(
                            width: 327.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffEEEEF1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'auth.didnt_receive_code'.tr(),
                                  style: AppTextStyle.bodyRegular.copyWith(
                                    color: const Color(0xff1D1E20),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Resend Logic
                                  },
                                  child: Text(
                                    'auth.resend_code'.tr(),
                                    style: AppTextStyle.bodyRegular.copyWith(
                                      color: const Color(0xff282A51),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 24.h),

                          // Verify Button
                          CustomGradientButton(
                            text: 'auth.verify_code'.tr(),
                            onPressed: state is AuthLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().verifyOtp(
                                        VerifyOtpRequestModel(
                                          otpCode: _pinController.text,
                                        ),
                                      );
                                    }
                                  },
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'يمكنك إعادة إرسال الرمز بعد 24 ثانية',
                            style: AppTextStyle.caption.copyWith(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
