import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ticket/features/packages/presentation/widgets/program/models/program_day.dart';

class ProgramDayCard extends StatelessWidget {
  final ProgramDay day;

  const ProgramDayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: 284.w,
        constraints: BoxConstraints(minHeight: 251.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFFEFEFE)],
            stops: [0.0, 0.5],
          ),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFFEAE9EB).withOpacity(0.07),
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Day label + title row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF40436F), Color(0xFF3D3F6D)],
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    day.dayLabel,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    day.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'Madani Arabic',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // ── Image if present
            if (day.imageUrl != null && day.imageUrl!.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  day.imageUrl!,
                  width: double.infinity,
                  height: 150.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                      const SizedBox.shrink(),
                ),
              ),
              SizedBox(height: 12.h),
            ],
            // ── Description
            HtmlWidget(
              day.description,
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6B7280),
                fontFamily: 'Madani Arabic',
                height: 1.7,
              ),
            ),
            SizedBox(height: 12.h),
            // ── Tags
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: day.tags.map(_buildTag).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
          fontFamily: 'Madani Arabic',
        ),
      ),
    );
  }
}
