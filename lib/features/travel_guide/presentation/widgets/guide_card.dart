import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuideCard extends StatelessWidget {
  final String title;
  final String description;
  final String tag1;
  final String tag2;
  final String imagePath;

  const GuideCard({
    super.key,
    required this.title,
    required this.description,
    required this.tag1,
    required this.tag2,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 328.h,
      decoration: BoxDecoration(
        color: const Color(0xFF8F8F8F), // Placeholder background
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            // Image
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

            // Top Badges Row
            Positioned(
              top: 16.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Tag (e.g. Europe)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                      ), // Reddish trending color
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      tag2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ),

                  // Right Tag (e.g. Trending)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.26),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      tag1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location Title with Icon
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Madani Arabic',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Madani Arabic',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
