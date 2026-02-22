import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/utils/app_colors.dart';

class SettingsRow extends StatelessWidget {
  final String icon;
  final String label;
  final bool isDestructive;
  final VoidCallback onTap;
  final bool showDivider;

  const SettingsRow({
    super.key,
    required this.icon,
    required this.label,
    required this.isDestructive,
    required this.onTap,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            // 3 rows must fit inside (241 - 32 padding - 36 title - 2 dividers) / 3 ≈ 57h each
            height: 57.h,
            child: Row(
              children: [
                /// Icon Circle
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF4F4F4),
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: SvgPicture.asset(
                    icon,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      isDestructive
                          ? const Color(0xFFE31E24)
                          : const Color(0xFF2B2E4A),
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                /// Label
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDestructive
                          ? const Color(0xFFE31E24)
                          : const Color(0xFF161616),
                    ),
                  ),
                ),

                /// Arrow
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),

        if (showDivider)
          Divider(height: 1, thickness: 1, color: const Color(0xFFE0E0E0)),
      ],
    );
  }
}
