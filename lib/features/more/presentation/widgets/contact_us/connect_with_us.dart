import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectWithUs extends StatelessWidget {
  final SocialMediaModel socialMedia;

  const ConnectWithUs({super.key, required this.socialMedia});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _SmallDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'contact.connect_with_us'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF282A50),
                ),
              ),
            ),
            const _SmallDivider(),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialIcon(icon: Icons.facebook, url: socialMedia.facebook.url),
            SizedBox(width: 20.w),
            _SocialIcon(
              icon: Icons.camera_alt_outlined, // Instagram
              url: socialMedia.instagram.url,
            ),
            SizedBox(width: 20.w),
            _SocialIcon(
              icon: Icons.close, // Twitter X
              url: socialMedia.twitter.url,
            ),
            SizedBox(width: 20.w),
            _SocialIcon(
              icon: Icons.phone_android, // WhatsApp
              url: socialMedia.whatsApp.url,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF282A50), size: 22.w),
      ),
    );
  }
}

class _SmallDivider extends StatelessWidget {
  const _SmallDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 1,
      color: const Color(0xFF282A50).withOpacity(0.2),
    );
  }
}
