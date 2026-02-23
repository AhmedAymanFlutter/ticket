import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/packages/presentation/widgets/explore_btn.dart';

class PackageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onExplore;
  final bool isDarkButton;

  const PackageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onExplore,
    this.isDarkButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.only(bottom: 16.h),
      constraints: BoxConstraints(minHeight: 324.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2B000000),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Image.network(
              imageUrl,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180.h,
                color: Colors.grey[200],
                child: Icon(Icons.image_not_supported, size: 50.sp),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                    fontFamily: 'Madani Arabic',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8A8A8A),
                    fontFamily: 'Madani Arabic',
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 16.h),

                ExploreButton(
                  width: double.infinity,
                  onTap: onExplore,
                  buttonText: buttonText,
                  isDarkButton: isDarkButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
