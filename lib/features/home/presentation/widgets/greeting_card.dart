import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max, // Let the Row expand
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'home.hello_there'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madani Arabic',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'home.world_waiting'.tr(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 10.sp,
                    fontFamily: 'Madani Arabic',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
