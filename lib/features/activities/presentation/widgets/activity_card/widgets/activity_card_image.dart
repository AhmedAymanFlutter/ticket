import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityCardImage extends StatelessWidget {
  final String imageUrl;

  const ActivityCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          child: imageUrl.startsWith('http')
              ? Image.network(
                  imageUrl,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/photo/image (1).png', // Sample image fallback
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  'assets/photo/image (1).png', // Sample image
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        // Best Choice Badge
        Positioned(
          top: 12.h,
          right: 12.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF282A51).withOpacity(0.66),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'activities.best_choice'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Madani Arabic',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
