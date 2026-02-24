import 'package:ticket/features/hotels/presentation/widgets/hotel_booking_card.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_categories_filters.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_image_gallery.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_filter_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_overview.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_amenities.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_room_types.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_policies.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetailsView extends StatefulWidget {
  const HotelDetailsView({super.key});

  @override
  State<HotelDetailsView> createState() => _HotelDetailsViewState();
}

class _HotelDetailsViewState extends State<HotelDetailsView> {
  int _selectedIndex = 0;

  final List<String> _images = [
    'assets/photo/image (1).png',
    'assets/photo/home_cobonant.png',
    'assets/photo/image (1).png',
    'assets/photo/home_cobonant.png',
    'assets/photo/image (1).png',
    'assets/photo/image (1).png',
    'assets/photo/image (1).png',
    'assets/photo/home_cobonant.png',
    'assets/photo/image (1).png',
    'assets/photo/home_cobonant.png',
    'assets/photo/image (1).png',
    'assets/photo/home_cobonant.png',
    'assets/photo/image (1).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: const TicketsAppBarDetails(
        title: 'تفاصيل الفندق',
        showBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            const Center(child: HotelFilterSection()),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                  children: [
                    Image.asset(
                      _images[_selectedIndex],
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
                    Positioned(
                      bottom: 12.h,
                      right: 12.w,
                      child: Container(
                        width: 66.w,
                        height: 37.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF282A50).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          '${_images.length} / ${_selectedIndex + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            const HotelCategoriesFilters(),
            SizedBox(height: 16.h),
            HotelImageGallery(
              images: _images,
              selectedIndex: _selectedIndex,
              onImageSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            SizedBox(height: 24.h),
            const HotelBookingCard(),
            SizedBox(height: 32.h),
            const HotelOverview(),
            SizedBox(height: 32.h),
            const HotelAmenities(),
            SizedBox(height: 32.h),
            const HotelRoomTypes(),
            SizedBox(height: 32.h),
            const HotelPolicies(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
