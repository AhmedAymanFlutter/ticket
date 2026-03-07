import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPackageCardImage extends StatelessWidget {
  final String imageUrl;
  final String categoryBadge;
  final String countryName;

  const CategoryPackageCardImage({
    super.key,
    required this.imageUrl,
    required this.categoryBadge,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 200.h,
            fit: BoxFit.cover,
          ),
        ),
        // Category Badge
        Positioned(
          top: 12.h,
          left: 12.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified,
                  color: const Color(0xFF282A50),
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  categoryBadge,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF282A50),
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Country Name Overlay
        Positioned(
          bottom: 12.h,
          right: 12.w,
          child: Text(
            countryName,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'Madani Arabic',
            ),
          ),
        ),
      ],
    );
  }
}
