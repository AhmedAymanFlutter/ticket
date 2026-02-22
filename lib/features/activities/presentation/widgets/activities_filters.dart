import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesFilters extends StatelessWidget {
  const ActivitiesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filters = [
      {
        'label': 'activities.filter_date'.tr(),
        'icon': Icons.calendar_month_outlined,
      },
      {
        'label': 'activities.filter_price'.tr(),
        'icon': Icons.keyboard_arrow_down,
      },
      {
        'label': 'activities.filter_persons'.tr(),
        'icon': Icons.keyboard_arrow_down,
      },
      {'label': 'activities.duration'.tr(), 'icon': Icons.keyboard_arrow_down},
    ];

    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: index == 2 ? const Color(0xFFE8E9FF) : Colors.white,
              borderRadius: BorderRadius.circular(41.r),
              border: Border.all(
                color: index == 2
                    ? const Color(0xFF282A51)
                    : const Color(0xFFD9D9D9),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  filters[index]['icon'],
                  size: 16.sp,
                  color: const Color(0xFF1A1A1A),
                ),
                SizedBox(width: 6.w),
                Text(
                  filters[index]['label'],
                  style: TextStyle(
                    color: const Color(0xFF1A1A1A),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
