import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/features/packages/presentation/widgets/explore_btn.dart';

class CategoryPackageCard extends StatelessWidget {
  final String imageUrl;
  final String categoryBadge;
  final String countryName;
  final String locationText;
  final List<String> cities;
  final String buttonText;
  final VoidCallback onPhoneTap;
  final VoidCallback onWhatsAppTap;
  final VoidCallback onDetailsTap;

  const CategoryPackageCard({
    super.key,
    required this.imageUrl,
    required this.categoryBadge,
    required this.countryName,
    required this.locationText,
    required this.cities,
    required this.buttonText,
    required this.onPhoneTap,
    required this.onWhatsAppTap,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
              // Category Badge
              Positioned(
                top: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.verified,
                        color: const Color(0xFF282A50),
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        categoryBadge,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF282A50),
                          fontFamily: 'Madani Arabic',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Country Name Overlay
              Positioned(
                bottom: 12.h,
                right: 12.w,
                child: Text(
                  countryName,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'Madani Arabic',
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Padding(
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
                    _IconButton(
                      onTap: onWhatsAppTap,
                      icon: SvgPicture.asset(
                        'assets/icons/watsapp.svg', // Assuming exists
                        width: 24.w,
                        height: 24.h,
                      ),
                      color: const Color(0xFF4CAF50),
                      iconColor: Colors.white,
                      // Assuming exists
                    ),
                    SizedBox(width: 12.w),
                    _IconButton(
                      onTap: onPhoneTap,
                      icon: SvgPicture.asset(
                        'assets/icons/customer-service.svg', // Assuming exists
                        width: 24.w,
                        height: 24.h,
                      ),
                      color: const Color(0xFFF0F0F0),
                      iconColor: const Color(0xFF282A50),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final Color color;
  final Color iconColor;
  final bool isSvg;
  final String? svgPath;

  const _IconButton({
    required this.onTap,
    required this.icon,
    required this.color,
    required this.iconColor,
    this.isSvg = false,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: isSvg && svgPath != null
              ? SvgPicture.asset(
                  'assets/icons/watsapp.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  placeholderBuilder: (context) => icon,
                )
              : icon,
        ),
      ),
    );
  }
}
