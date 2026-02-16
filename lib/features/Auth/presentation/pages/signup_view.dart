import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';

import 'package:ticket/core/widgets/custom_gradient_button.dart';
import 'package:ticket/core/widgets/custom_text_field.dart';
import 'package:ticket/features/auth/presentation/pages/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedCity = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // List of Saudi Cities
  final List<String> _cities = [
    'الرياض',
    'جدة',
    'مكة المكرمة',
    'المدينة المنورة',
    'الدمام',
    'الطائف',
    'تبوك',
    'بريدة',
    'خميس مشيط',
    'أبها',
    'حائل',
    'الجبيل',
    'الخرج',
    'نجران',
    'ينبع',
    'الأحساء',
    'عرعر',
    'جازان',
    'سكاكا',
    'الباحة',
  ];

  void _showCityPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'auth.city'.tr(), // "Select City" or just "City"
                style: AppTextStyle.heading3.copyWith(color: Colors.black),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  itemCount: _cities.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[200],
                    indent: 20.w,
                    endIndent: 20.w,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _cities[index],
                        style: AppTextStyle.bodyRegular.copyWith(
                          color: Colors.black87,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedCity = _cities[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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

          // Title "إنشاء حساب" with arrow on top of image
          Positioned(
            top: 140.h, // Adjust based on screenshot position
            right: 24.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  'auth.signup'.tr(),
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
                      // Name Field
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'auth.name'.tr(),
                      ),
                      SizedBox(height: 16.h),

                      // Email Field
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'auth.email'.tr(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.h),

                      // Phone Field with Country Code (Unified Container)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Phone Number Field
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.right,
                                style: AppTextStyle.bodyRegular.copyWith(
                                  color: Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'auth.phone'.tr(),
                                  hintStyle: AppTextStyle.bodyRegular.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                ),
                              ),
                            ),

                            // Divider
                            Container(
                              height: 40.h,
                              width: 1,
                              color: Colors.grey[300],
                            ),

                            // Country Code Picker
                            CountryCodePicker(
                              onChanged: (code) {
                                setState(() {});
                              },
                              initialSelection: 'SA',
                              favorite: const ['+966', 'SA', '+20', 'EG'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              textStyle: AppTextStyle.bodyRegular.copyWith(
                                color: Colors.black87,
                                fontSize: 14.sp,
                              ),
                              dialogTextStyle: AppTextStyle.bodyRegular,
                              searchDecoration: InputDecoration(
                                hintText: 'auth.search'.tr(),
                                hintStyle: AppTextStyle.bodyRegular.copyWith(
                                  color: Colors.grey[400],
                                ),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // City Dropdown Field
                      GestureDetector(
                        onTap: () {
                          _showCityPicker();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  _selectedCity.isEmpty
                                      ? 'auth.city'.tr()
                                      : _selectedCity,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.bodyRegular.copyWith(
                                    color: _selectedCity.isEmpty
                                        ? Colors.grey[400]
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey[600],
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
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
                      SizedBox(height: 32.h),

                      // Register Button
                      CustomGradientButton(
                        text: 'auth.register'.tr(),
                        onPressed: () {
                          // Validate and Sign up
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
                          _buildSocialButton(Icons.apple, Colors.black),
                          SizedBox(width: 16.w),
                          _buildSocialButton(
                            null,
                            Colors.white,
                            child: Image.asset(
                              'assets/icons/google.png',
                              width: 24.w,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          _buildSocialButton(
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
                              'auth.already_have_account'.tr(),
                              style: AppTextStyle.bodyRegular.copyWith(
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                              );
                            },
                            child: Text(
                              'auth.login_link'.tr(),
                              style: AppTextStyle.bodyRegular.copyWith(
                                color: Colors.black,
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

  Widget _buildSocialButton(IconData? icon, Color bgColor, {Widget? child}) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child ?? Icon(icon, color: Colors.white, size: 24.sp),
    );
  }
}
