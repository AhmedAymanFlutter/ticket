import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ticket/features/more/presentation/widgets/contact_us/Social_Icon_widgets.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';

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
            const SmallDivider(),
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
            const SmallDivider(),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(
              icon: Image.asset(
                'assets/photo/Facebook.png',
                width: 40.w,
                height: 40.h,
              ),
              url: socialMedia.facebook.url,
            ),
            SizedBox(width: 20.w),
            SocialIcon(
              icon: Image.asset(
                'assets/photo/instagram.png',
                width: 40.w,
                height: 40.h,
              ),
              url: socialMedia.instagram.url,
            ),
            SizedBox(width: 20.w),
            SocialIcon(
              icon: Image.asset(
                'assets/photo/twitter.png',
                width: 40.w,
                height: 40.h,
              ),
              url: socialMedia.twitter.url,
            ),
            SizedBox(width: 20.w),
            SocialIcon(
              icon: Image.asset(
                'assets/photo/whatsapp.png',
                width: 40.w,
                height: 40.h,
              ),
              url: socialMedia.whatsApp.url,
            ),
          ],
        ),
      ],
    );
  }
}
