import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_cubit.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_state.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_booking_card.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_overview.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_amenities.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_room_types.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_reviews_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_policies_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_contact_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/injection_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDetailsView extends StatefulWidget {
  final dynamic hotelId;
  const HotelDetailsView({super.key, required this.hotelId});

  @override
  State<HotelDetailsView> createState() => _HotelDetailsViewState();
}

class _HotelDetailsViewState extends State<HotelDetailsView> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.hasClients &&
            _scrollController.offset > (250.h - kToolbarHeight);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<HotelDetailsCubit>()..getHotelDetails(widget.hotelId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
          builder: (context, state) {
            if (state is HotelDetailsFailure) {
              return CustomErrorWidget(
                message: state.message,
                onRetry: () => context
                    .read<HotelDetailsCubit>()
                    .getHotelDetails(widget.hotelId),
              );
            }

            final isLoading = state is HotelDetailsLoading;
            final hotel =
                state is HotelDetailsSuccess ? state.hotelDetails : null;

            return Skeletonizer(
              enabled: isLoading,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  _buildSliverAppBar(hotel),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBasicInfo(hotel),
                          SizedBox(height: 24.h),
                          HotelBookingCard(hotel: hotel),
                          SizedBox(height: 32.h),
                          HotelOverview(description: hotel?.description),
                          SizedBox(height: 32.h),
                          HotelAmenities(facilities: hotel?.facilities),
                          SizedBox(height: 32.h),
                          HotelRoomTypes(rooms: hotel?.rooms),
                          SizedBox(height: 32.h),
                          if (hotel?.reviews != null)
                            HotelReviewsSection(reviews: hotel!.reviews),
                          SizedBox(height: 32.h),
                          HotelPoliciesSection(policies: hotel?.policies),
                          SizedBox(height: 32.h),
                          HotelContactSection(
                            contact: hotel?.contact,
                            address: hotel?.address ?? '',
                            latitude: hotel?.latitude,
                            longitude: hotel?.longitude,
                          ),
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(hotel) {
    final images = hotel?.images ?? [];
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.all(8.w),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.9),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1D2939)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const Icon(Icons.favorite_border, color: Color(0xFF1D2939)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const Icon(Icons.share_outlined, color: Color(0xFF1D2939)),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (images.isNotEmpty)
              Image.network(
                images[0],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
              )
            else if (hotel?.imageCover != null && hotel!.imageCover.isNotEmpty)
              Image.network(
                hotel.imageCover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
              )
            else
              _buildErrorPlaceholder(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: _isAppBarExpanded
            ? Text(
                hotel?.name ?? 'تفاصيل الفندق',
                style: TextStyle(
                  color: const Color(0xFF1D2939),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Madani Arabic',
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildBasicInfo(hotel) {
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
                  hotel.name,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madani Arabic',
                    color: const Color(0xFF1D2939),
                  ),
                ),
              ),
              if (hotel.stars > 0)
                Row(
                  children: List.generate(
                    hotel.stars,
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
              Text(
                '${hotel.city}, ${hotel.address}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF667085),
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
                  color: const Color(0xFFFE406F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star_rounded,
                        color: const Color(0xFFFE406F), size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      hotel.rating.toString(),
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
              Text(
                hotel.ratingWord,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Madani Arabic',
                  color: const Color(0xFF1D2939),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '(${hotel.ratingCount} تقييم)',
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

  Widget _buildErrorPlaceholder() {
    return Container(
      width: double.infinity,
      height: 300.h,
      color: Colors.grey[300],
      child: const Icon(Icons.image),
    );
  }
}
