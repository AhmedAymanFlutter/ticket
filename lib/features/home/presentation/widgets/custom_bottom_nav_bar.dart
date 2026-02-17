import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/helper/app_text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      decoration: BoxDecoration(
        color: const Color(0xFF282A51),
        boxShadow: [
          BoxShadow(
            color: const Color(0x99D9D9D9),
            offset: const Offset(0, -8),
            blurRadius: 15.4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, 'assets/icons/home.svg', 'nav.home'.tr()),
          _buildNavItem(1, 'assets/icons/package.svg', 'nav.packages'.tr()),
          _buildNavItem(2, 'assets/icons/flight.svg', 'nav.flights'.tr()),
          _buildNavItem(3, 'assets/icons/boat.svg', 'nav.activities'.tr()),
          _buildNavItem(4, 'assets/icons/more.svg', 'nav.more'.tr()),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 63.w,
        height: 61.h,
        padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF24264A),
                borderRadius: BorderRadius.circular(8.r),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      iconPath,
                      width: 23.w,
                      height: 25.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : SvgPicture.asset(
                    iconPath,
                    width: 23.w,
                    height: 25.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
            SizedBox(height: 8.h), // Gap 8px
            Text(
              label,
              style: AppTextStyle.bodySmall.copyWith(
                color: isSelected ? const Color(0xFFFD6B38) : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 10
                    .sp, // Adjusted from 12 to fit better if needed, or keep 12
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
