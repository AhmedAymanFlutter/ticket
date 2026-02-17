import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneFieldWithCountryPicker extends StatelessWidget {
  final TextEditingController controller;
  final Function(CountryCode)? onCountryChanged;
  final String initialCountryCode;

  const PhoneFieldWithCountryPicker({
    super.key,
    required this.controller,
    this.onCountryChanged,
    this.initialCountryCode = 'SA',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Row(
        children: [
          /// Country Picker
          CountryCodePicker(
            onChanged: onCountryChanged,
            initialSelection: initialCountryCode,
            favorite: const ['+966', 'SA', '+20', 'EG'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            textStyle: TextStyle(color: Colors.black87, fontSize: 14.sp),
            padding: EdgeInsets.zero,
          ),

          /// Divider
          Container(height: 48.h, width: 1, color: Colors.grey[300]),

          /// Phone Number
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              // textAlign: TextAlign.right, // Removed to support dynamic direction
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'auth.phone'.tr(),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
