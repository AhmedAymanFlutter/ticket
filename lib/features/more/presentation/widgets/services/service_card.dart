import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCard extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 164.w,
        height: 194.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 4,
              spreadRadius: -2,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 6,
              spreadRadius: -1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Icon Circle ───────────────────────────────────────
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(50.r),
              ),
              padding: EdgeInsets.all(14.w),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF2B2E4A),
                  BlendMode.srcIn,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // ── Gradient Label ────────────────────────────────────
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
              ).createShader(bounds),
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white, // masked by shader
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
