import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/helper/contact_helper.dart';

class PackageContactSection extends StatelessWidget {
  final String? whatsappNumber;
  const PackageContactSection({super.key, this.whatsappNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'contact.book_trip'.tr(),
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF1D2939),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'more.call_now'.tr(), // or create a better key if needed
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF667085),
            ),
          ),
          SizedBox(height: 24.h),
          _buildWhatsAppButton(),
          SizedBox(height: 24.h),
          _buildDivider(),
          SizedBox(height: 16.h),
          _buildStatusIndicator(),
        ],
      ),
    );
  }

  Widget _buildWhatsAppButton() {
    return GestureDetector(
      onTap: () => ContactHelper.launchWhatsApp(number: whatsappNumber),
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: const Color(0xFF4ADE80),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x334ADE80),
              offset: const Offset(0, 8),
              blurRadius: 16,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${'more.contact_whatsapp'.tr()} ${whatsappNumber != null ? '($whatsappNumber)' : ''}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Madani Arabic',
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12.w),
            SvgPicture.asset(
              'assets/icons/watsapp.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 28.w,
              height: 28.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.h,
      width: double.infinity,
      color: const Color(0xFFF3F4F6),
    );
  }

  Widget _buildStatusIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'contact.support_team'.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Madani Arabic',
            color: const Color(0xFF667085),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 8.w,
          height: 8.h,
          decoration: const BoxDecoration(
            color: Color(0xFF4ADE80),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

// Global function for consistency with other widgets
Widget buildContactSection({String? whatsappNumber}) =>
    PackageContactSection(whatsappNumber: whatsappNumber);
