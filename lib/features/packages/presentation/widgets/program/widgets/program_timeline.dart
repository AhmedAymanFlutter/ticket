import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgramTimeline extends StatelessWidget {
  final int count;
  final double itemHeight; // height of each day item block

  const ProgramTimeline({
    super.key,
    required this.count,
    this.itemHeight = 295,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(count, (index) {
        final isLast = index == count - 1;
        return Column(
          children: [
            // Circle dot
            Container(
              width: 14.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: const Color(0xFF282A50),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF282A50).withOpacity(0.15),
                  width: 3,
                ),
              ),
            ),
            // Connecting vertical line (skip for last)
            if (!isLast)
              Container(
                width: 2.w,
                height: itemHeight.h,
                color: const Color(0xFFE5E7EB),
              ),
          ],
        );
      }),
    );
  }
}
