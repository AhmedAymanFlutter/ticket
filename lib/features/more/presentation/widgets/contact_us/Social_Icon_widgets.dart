import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final Widget icon;
  final String url;

  const SocialIcon({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => launchUrl(Uri.parse(url)), child: icon);
  }
}

class SmallDivider extends StatelessWidget {
  const SmallDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 1,
      color: const Color(0xFF282A50).withOpacity(0.2),
    );
  }
}
