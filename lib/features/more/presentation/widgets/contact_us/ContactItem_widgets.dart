import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactItem extends StatelessWidget {
  final String iconPath;
  final IconData fallbackIcon;
  final String title;
  final List<String> details;
  final Function(String) onTap;

  const ContactItem({
    super.key,
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
            child: SvgPicture.asset(
              iconPath,
              color: Colors.white,
              width: 24.w,
              placeholderBuilder: (_) =>
                  Icon(fallbackIcon, color: Colors.white, size: 24.w),
            ),
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
