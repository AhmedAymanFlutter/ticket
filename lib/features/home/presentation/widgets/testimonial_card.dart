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

        SizedBox(width: 14.w),

        // Card Stack - Wrapped in Expanded to prevent overflow
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Premium Card
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 180.h,
                    maxWidth: 280.w, // Use maxWidth to avoid overflow
                  ),
                  margin: EdgeInsets.only(top: 32.h, bottom: 16.h),
                  padding: EdgeInsets.fromLTRB(20.w, 48.h, 20.w, 20.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFFF0F0F0),
                      width: 1,
                    ),
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
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1A1A),
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Stars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                            child: Icon(
                              index < rating.floor()
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: const Color(0xFFFFC107),
                              size: 18.sp,
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 18.h),
                      // Comment
                      Text(
                        comment,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF4A4A4A),
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Floating Avatar with Glow
              Positioned(
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFE406F).withOpacity(0.12),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Container(
                    width: 58.w,
                    height: 58.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(avatar),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 3.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 14.w),

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
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: const Color(0xFFF5F5F5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, size: 15.sp, color: const Color(0xFFD1D1D1)),
      ),
    );
  }
}
