import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/services/data/models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.service, required this.onTap});

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
            // ── Image Circle ───────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.network(
                service.imageCover,
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100.w,
                  height: 100.w,
                  color: const Color(0xFFF4F4F4),
                  child: const Icon(
                    Icons.broken_image_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // ── Gradient Label ────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                ).createShader(bounds),
                child: Text(
                  service.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // masked by shader
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
