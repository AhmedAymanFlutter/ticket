import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 52.h,
        child: Row(
          children: [
            // ✓ on LEFT (in RTL, first child goes to the left)
            SizedBox(
              width: 28.w,
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 18.sp,
                      color: const Color(0xFF282A51),
                    )
                  : null,
            ),

            SizedBox(width: 8.w),

            // Label on RIGHT
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Madani Arabic',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000619),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
