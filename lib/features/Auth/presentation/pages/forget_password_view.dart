import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/features/Auth/presentation/pages/widgets/PhoneFieldWithCountryPicker_widget.dart';
import 'package:ticket/features/Auth/presentation/pages/otp_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
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

          // Title "نسيت كلمة المرور؟" with arrow on top of image
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
                  'auth.forget_password'
                      .tr(), // Make sure to add this key to your localization file
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
                      // Helper Text
                      Text(
                        'auth.enter_phone_reset'
                            .tr(), // "ادخل رقم جوالك سيتم إرسال رمز التحقق إلى رقم هاتفك."
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyRegular.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      PhoneFieldWithCountryPicker(
                        controller: _phoneController,
                        initialCountryCode: 'SA',
                        onCountryChanged: (code) {
                          print(code.dialCode);
                        },
                      ),
                      SizedBox(height: 32.h),

                      // Send Code Button
                      CustomGradientButton(
                        text: 'auth.send_verification_code'
                            .tr(), // "ارسل رمز التحقق"
                        onPressed: () {
                          // Validate and Navigate to OTP
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtpView(),
                            ),
                          );
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
}
