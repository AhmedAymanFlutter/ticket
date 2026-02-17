import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestimonialCard extends StatelessWidget {
  final String name;
  final String comment;
  final double rating;
  final String avatar;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
    required this.avatar,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Previous Button
        _buildNavButton(icon: Icons.arrow_back_ios_new, onTap: onPrevious),

        SizedBox(width: 12.w),

        // Card Stack
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 269.w,

              constraints: BoxConstraints(minHeight: 166.h),
              margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
              padding: EdgeInsets.fromLTRB(14.w, 42.h, 14.w, 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h), // Spacing
                  // Stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Icon(
                          Icons.star_rounded,
                          color: const Color(0xFFFFC107),
                          size: 20.sp,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.h), // Spacing
                  // Comment
                  Text(
                    comment,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A1A1A),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Floating Avatar
            Positioned(
              top: 0,
              child: Container(
                width: 63.w,
                height: 63.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(avatar),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 6, // User specified border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(width: 12.w),

        // Next Button
        _buildNavButton(icon: Icons.arrow_forward_ios, onTap: onNext),
      ],
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 16.sp, color: const Color(0xFFBDBDBD)),
      ),
    );
  }
}
