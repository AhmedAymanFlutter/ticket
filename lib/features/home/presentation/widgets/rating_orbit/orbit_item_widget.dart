import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../rating_orbit_animation.dart';

class OrbitItemWidget extends StatelessWidget {
  final OrbitItem item;
  final bool isActive;

  const OrbitItemWidget({
    super.key,
    required this.item,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if (item.type == OrbitItemType.dot) {
      return _buildDot();
    } else {
      return AnimatedScale(
        scale: isActive ? 1.2 : 0.9,
        duration: const Duration(milliseconds: 300),
        child: _buildReviewCard(item.data!, isActive),
      );
    }
  }

  Widget _buildDot() {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color: item.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: item.color!.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> data, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        border: Border.all(
          color: isActive
              ? const Color(0xFFFE406F).withOpacity(0.5)
              : const Color(0xFFF0F0F0),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(data['avatar']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isActive) ...[
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${data['rating']}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: const Color(0xFFFFC107),
                      size: 10.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
