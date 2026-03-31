import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String distance;
  final int price;
  final String tag;
  final String discount;
  final VoidCallback? onTap;

  const HotelCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.distance,
    required this.price,
    required this.tag,
    required this.discount,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 255.w,
        height: 337.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1F000000), // #0000001F
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Rating Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.network(
                    imagePath,
                    width: double.infinity,
                    height: 150.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 150.h,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFFB211),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '4.9',
                          style: TextStyle(
                            color: const Color(0xFF161616),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Madani Arabic',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF161616),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Madani Arabic',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    // Subtitle
                    Text(
                      'home.minutes_to_center'.tr(args: ['5']),
                      style: TextStyle(
                        color: const Color(0xFF1B2136),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                    const Spacer(),
                    // Location Row
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: const Color(0xFF8E8E93),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              color: const Color(0xFF8E8E93),
                              fontSize: 12.sp,
                              fontFamily: 'Madani Arabic',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    // Airport Row
                    Row(
                      children: [
                        Icon(
                          Icons.business_outlined,
                          color: const Color(0xFF8E8E93),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            distance,
                            style: TextStyle(
                              color: const Color(0xFF8E8E93),
                              fontSize: 12.sp,
                              fontFamily: 'Madani Arabic',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Bottom Row: Explore & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Explore Button
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF282A51),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'common.explore'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Madani Arabic',
                            ),
                          ),
                        ),
                        // Price
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$price',
                              style: TextStyle(
                                color: const Color(0xFF1B2136),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Madani Arabic',
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'common.price_per_night'.tr(),
                              style: TextStyle(
                                color: const Color(0xFF6B6E82),
                                fontSize: 12.sp,
                                fontFamily: 'Madani Arabic',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
