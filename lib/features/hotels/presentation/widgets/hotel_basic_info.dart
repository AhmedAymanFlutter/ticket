import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelBasicInfo extends StatelessWidget {
  final HotelDetailsEntity? hotel;

  const HotelBasicInfo({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    if (hotel == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  hotel!.name,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF1D2939),
                  ),
                ),
              ),
              if (hotel!.stars > 0)
                Row(
                  children: List.generate(
                    hotel!.stars,
                    (index) => Icon(Icons.star_rounded,
                        color: const Color(0xFFFFC107), size: 20.sp),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  color: const Color(0xFF667085), size: 16.sp),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  '${hotel!.city}, ${hotel!.address}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF667085),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE406F).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star_rounded,
                        color: const Color(0xFFFE406F), size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      hotel!.rating.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFE406F),
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Flexible(
                child: Text(
                  hotel!.ratingWord,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF1D2939),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '(${hotel!.ratingCount} تقييم)',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF667085),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
