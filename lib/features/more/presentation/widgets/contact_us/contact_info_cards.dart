import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoCards extends StatelessWidget {
  final AppSettingsModel settings;

  const ContactInfoCards({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _ContactItem(
                iconPath:
                    'assets/icons/mail-01.svg', // Assuming this exists or using fallback
                fallbackIcon: Icons.email_outlined,
                title: 'contact.support_service'.tr(),
                details: settings.contactInfo.emails
                    .map((e) => e.email)
                    .toList(),
                onTap: (email) => launchUrl(Uri.parse('mailto:$email')),
              ),
            ),
            VerticalDivider(
              width: 32.w,
              thickness: 1,
              color: const Color(0xFFEEEEEE),
            ),
            Expanded(
              child: _ContactItem(
                iconPath: 'assets/icons/phone-01.svg',
                fallbackIcon: Icons.phone_outlined,
                title: 'contact.support_team'.tr(),
                details: settings.contactInfo.phones
                    .map((p) => p.number)
                    .toList(),
                onTap: (phone) => launchUrl(Uri.parse('tel:$phone')),
              ),
            ),
            VerticalDivider(
              width: 32.w,
              thickness: 1,
              color: const Color(0xFFEEEEEE),
            ),
            Expanded(
              child: _ContactItem(
                iconPath: 'assets/icons/location-01.svg',
                fallbackIcon: Icons.location_on_outlined,
                title: 'contact.visit_office'.tr(),
                details: settings.contactInfo.addresses,
                onTap: (address) => launchUrl(
                  Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final String iconPath;
  final IconData fallbackIcon;
  final String title;
  final List<String> details;
  final Function(String) onTap;

  const _ContactItem({
    required this.iconPath,
    required this.fallbackIcon,
    required this.title,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Madani Arabic',
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: 48.w,
          height: 48.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
            ),
          ),
          child: Center(
            child: Icon(fallbackIcon, color: Colors.white, size: 24.w),
            // SvgPicture.asset(iconPath, color: Colors.white, width: 24.w,
            //   placeholderBuilder: (_) => Icon(fallbackIcon, color: Colors.white, size: 24.w)),
          ),
        ),
        SizedBox(height: 12.h),
        ...details
            .take(2)
            .map(
              (detail) => Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: GestureDetector(
                  onTap: () => onTap(detail),
                  child: Text(
                    detail,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
