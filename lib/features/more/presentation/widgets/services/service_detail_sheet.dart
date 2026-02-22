import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Data model for a service item
class ServiceItem {
  final String icon;
  final String label;
  final String description;
  final String howToUse;

  const ServiceItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.howToUse,
  });
}

/// Shows the service detail bottom sheet
void showServiceDetailSheet(BuildContext context, ServiceItem service) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ServiceDetailSheet(service: service),
  );
}

class _ServiceDetailSheet extends StatelessWidget {
  final ServiceItem service;
  const _ServiceDetailSheet({required this.service});

  @override
  Widget build(BuildContext context) {
    // height: 636 → fills bottom portion (top: 525 on 1080px screen)
    return Container(
      height: 636.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          // ── Drag Handle ────────────────────────────────────────
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // ── Scrollable Content ─────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  // ── Top Header (Close + Title) ──────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        service.label,
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: 24.sp,
                          color: const Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),
                  const Divider(color: Color(0xFFF0F0F0), thickness: 1),
                  SizedBox(height: 16.h),

                  // ── Description ───────────────────────────────
                  Text(
                    service.description,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A1A1A),
                      height: 1.8,
                    ),
                  ),

                  SizedBox(height: 24.h),
                  const Divider(color: Color(0xFFF0F0F0), thickness: 1),
                  SizedBox(height: 24.h),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/help.svg',
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'more.how_to_use'.tr(),
                            style: TextStyle(
                              fontFamily: 'Madani Arabic',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    service.howToUse,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A1A1A),
                      height: 1.8,
                    ),
                    textAlign: TextAlign.right, // RTL content
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),

          // ── Action Buttons (fixed at bottom) ───────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
            child: Column(
              children: [
                // WhatsApp Button
                _ActionButton(
                  label: 'more.contact_whatsapp'.tr(),
                  icon: 'assets/icons/watsapp.svg',
                  backgroundColor: const Color(0xFF25D366),
                  textColor: Colors.white,
                  onTap: () {},
                ),
                SizedBox(height: 12.h),
                // Call Now Button
                _ActionButton(
                  label: 'more.call_now'.tr(),
                  icon: 'assets/icons/customer-service.svg',
                  backgroundColor: const Color(0xFFEAEAEA),
                  textColor: const Color(0xFF1A1A1A),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final String icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.w,
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Madani Arabic',
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
