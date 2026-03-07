import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/features/packages/presentation/widgets/explore_btn.dart';
import 'package:ticket/features/packages/presentation/widgets/category_package_card/package_action_icon_button.dart';

class CategoryPackageCardContent extends StatelessWidget {
  final List<String> cities;
  final String buttonText;
  final VoidCallback onPhoneTap;
  final VoidCallback onWhatsAppTap;
  final VoidCallback onDetailsTap;

  const CategoryPackageCardContent({
    super.key,
    required this.cities,
    required this.buttonText,
    required this.onPhoneTap,
    required this.onWhatsAppTap,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location Row
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  cities.join('، '),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF8A8A8A),
                    fontFamily: 'Madani Arabic',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(height: 1, color: Colors.grey[200]),
          SizedBox(height: 16.h),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: ExploreButton(
                  onTap: onDetailsTap,
                  buttonText: buttonText,
                  isDarkButton: true,
                  height: 48.h,
                ),
              ),
              SizedBox(width: 12.w),
              // WhatsApp Button
              PackageActionIconButton(
                onTap: onWhatsAppTap,
                icon: SvgPicture.asset(
                  'assets/icons/watsapp.svg',
                  width: 32.w,
                  height: 32.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                color: const Color(0xFF4CAF50),
              ),
              SizedBox(width: 12.w),
              PackageActionIconButton(
                onTap: onPhoneTap,
                icon: SvgPicture.asset(
                  'assets/icons/customer-service.svg',
                  width: 32.w,
                  height: 32.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF282A50),
                    BlendMode.srcIn,
                  ),
                ),
                color: const Color(0xFFF0F0F0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
