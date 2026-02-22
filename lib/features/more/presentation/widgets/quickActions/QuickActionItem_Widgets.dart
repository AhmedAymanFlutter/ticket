import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QuickActionItem {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final String? trailing;
  final bool isPng;

  const QuickActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
    this.isPng = false,
  });
}

class QuickActionCard extends StatelessWidget {
  final QuickActionItem item;

  const QuickActionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: 149.5.w,
        decoration: BoxDecoration(
          color: const Color(0x80E1F4FF), // #E1F4FF80 (50% opacity)
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: item.isPng
                  ? Image.asset(
                      item.icon,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      item.icon,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.scaleDown,
                    ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      item.label,
                      style: TextStyle(
                        fontFamily: 'Madani Arabic',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF161616),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (item.trailing != null) ...[
                  SizedBox(width: 4.w),
                  Text(
                    item.trailing!,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF161616),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 16.sp,
                    color: const Color(0xFF161616),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
