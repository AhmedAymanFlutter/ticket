import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelRoomTypes extends StatelessWidget {
  final List<HotelRoomEntity>? rooms;
  const HotelRoomTypes({super.key, this.rooms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _buildHeader(),
        ),
        SizedBox(height: 16.h),
        _buildRoomList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFE406F),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'أنواع الغرف والأسعار',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Madani Arabic',
                color: const Color(0xFF1D2939),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'عرض الكل',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFFFE406F),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoomList() {
    if (rooms == null) {
      return Column(
        children: List.generate(
          2,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const RoomCard(
              image: 'loading',
              title: 'Loading...',
              rating: '0.0',
              guests: '...',
              area: '...',
              bedType: '...',
              price: '0',
            ),
          ),
        ),
      );
    }

    if (rooms!.isEmpty) {
      return const Center(child: Text('No rooms available'));
    }

    return Column(
      children: rooms!.map((room) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: RoomCard(
            image: room.photos.isNotEmpty ? room.photos.first : '',
            title: room.name,
            rating: '4.9', // API doesn't seem to provide per-room rating
            guests: '${room.adults} ضيوف',
            area: '35 متر مربع', // API doesn't seem to provide area
            bedType: room.bedOptions,
            price: room.price,
            mealPlan: room.mealPlan,
            cancellationText: room.cancellationText,
          ),
        );
      }).toList(),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String guests;
  final String area;
  final String bedType;
  final String price;
  final String? mealPlan;
  final String? cancellationText;

  const RoomCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.guests,
    required this.area,
    required this.bedType,
    required this.price,
    this.mealPlan,
    this.cancellationText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.6.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        children: [
          // Room Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            child: image == 'loading' || image.isEmpty
                ? Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image),
                  )
                : Image.network(
                    image,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 200.h,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image),
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleAndRating(),
                SizedBox(height: 12.h),
                _buildSpecs(),
                if (mealPlan != null || cancellationText != null) ...[
                  SizedBox(height: 12.h),
                  _buildExtraInfo(),
                ],
                SizedBox(height: 16.h),
                _buildPriceAndAction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Madani Arabic',
            color: const Color(0xFF1A1A1A),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: const Color(0xFFFFC107),
              size: 18.sp,
            ),
            Text(
              rating,
              style: TextStyle(
                fontFamily: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xFF1D2939),
                ).fontFamily,
              ),
            ),
            SizedBox(width: 4.w),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.people_outline, size: 16.sp, color: const Color(0xFF667085)),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            guests,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF667085),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildDivider(),
        Icon(Icons.square_foot, size: 16.sp, color: const Color(0xFF667085)),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            area,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF667085),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildDivider(),
        Icon(Icons.king_bed_outlined, size: 16.sp, color: const Color(0xFF667085)),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            bedType,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Madani Arabic',
              color: const Color(0xFF667085),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildExtraInfo() {
    return Column(
      children: [
        if (mealPlan != null)
          Row(
            children: [
              Icon(Icons.restaurant, size: 14.sp, color: const Color(0xFF039855)),
              SizedBox(width: 8.w),
              Text(
                mealPlan!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF039855),
                ),
              ),
            ],
          ),
        if (mealPlan != null && cancellationText != null) SizedBox(height: 4.h),
        if (cancellationText != null)
          Row(
            children: [
              Icon(Icons.event_available, size: 14.sp, color: const Color(0xFF039855)),
              SizedBox(width: 8.w),
              Text(
                cancellationText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF039855),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 12.h,
      width: 1.w,
      color: const Color(0xFFD0D5DD),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
    );
  }

  Widget _buildPriceAndAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Price Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ابتداءً من',
              style: TextStyle(
                fontFamily: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: const Color(0xFF6A7282),
                ).fontFamily,
              ),
            ),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: const Color(0xFFFE406F),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  '﷼',
                  style: TextStyle(
                    color: const Color(0xFFFE406F),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Booking Button
        Container(
          width: 114.04.w,
          height: 40.h,
          decoration: BoxDecoration(
            gradient: AppColors.secondary,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: Text(
              'احجز الآن',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Madani Arabic',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
