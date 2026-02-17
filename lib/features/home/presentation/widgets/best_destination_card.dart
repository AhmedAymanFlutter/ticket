import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/features/home/presentation/widgets/watsapp_btn.dart';

class BestDestinationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int days;
  final int price;

  const BestDestinationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.days,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 219.w,
      height: 399.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFEAE9EB), // var(--stroke-Color, #EAE9EB)
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 190.h, // Approx half height for image
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 14.sp,
                      color: const Color(0xFF8E8E93),
                      height: 1.5, // Reduced line height to prevention overflow
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 12.h),

                  // Days
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/day.svg',
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                          const Color(0xFF8E8E93),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '$days ${'common.days'.tr()}',
                        style: TextStyle(
                          fontFamily:
                              GoogleFonts.ibmPlexSansArabic().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF8E8E93),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Divider (Height handles spacing)
                  Divider(
                    color: const Color(
                      0xFFEAE9EB,
                    ), // var(--stroke-Color, #EAE9EB)
                    thickness: 1,
                    height: 8.h, // Reduced height (was 16.h)
                  ),

                  // Price and Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price (Right side in RTL)
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                '$price',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.ibmPlexSansArabic()
                                      .fontFamily,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1A1A1A),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.h,
                              ), // Align symbol with baseline
                              child: SvgPicture.asset(
                                'assets/icons/mony.svg',
                                width: 13.w,
                                height: 14.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 8.w),

                      // Button (Left side in RTL)
                      WatsappBtn(
                        onTap: () {},
                        // width removed to allow auto-sizing
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(width: 6.w),
                            Text(
                              'common.contact_now'.tr(),
                              style: TextStyle(
                                fontFamily: 'Madani Arabic',
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
