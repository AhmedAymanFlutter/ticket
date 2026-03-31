import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket/core/helper/contact_helper.dart';
import 'package:ticket/features/home/presentation/widgets/watsapp_btn.dart';

class PlanTripCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String duration;
  final int price;
  final String? whatsappNumber;

  const PlanTripCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    this.whatsappNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.w,
      height: 338.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFEAE9EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Time Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
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
              // Time Badge
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        duration,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Madani Arabic',
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
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
                SizedBox(height: 6.h),
                // Description
                Text(
                  description,
                  style: TextStyle(
                    color: const Color(0xFF6B6E82),
                    fontSize: 12.sp,
                    fontFamily: 'Madani Arabic',
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                
                const Divider(color: Color(0xFFEAE9EB), thickness: 1),
                
                SizedBox(height: 10.h),

                // Bottom Row: WhatsApp & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WatsappBtn(
                      onTap: () => ContactHelper.launchWhatsApp(
                        number: whatsappNumber,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/watsapp.svg',
                            width: 18.w,
                            height: 18.h,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'common.contact_now'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Madani Arabic',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$price',
                          style: TextStyle(
                            color: const Color(0xFF1B2136),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Madani Arabic',
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: SvgPicture.asset(
                            'assets/icons/mony.svg',
                            width: 14.w,
                            height: 14.h,
                          ),
                        ),
                      ],
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
