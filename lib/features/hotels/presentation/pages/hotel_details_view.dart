import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_cubit.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_state.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_amenities.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_basic_info.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_booking_card.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_contact_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_details_app_bar.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_overview.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_policies_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_reviews_section.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_room_types.dart';
import 'package:ticket/injection_container.dart';

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
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final expanded = _scrollController.hasClients &&
        _scrollController.offset > (250.h - kToolbarHeight);
    if (expanded != _isAppBarExpanded) {
      setState(() => _isAppBarExpanded = expanded);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
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
                  HotelDetailsAppBar(
                    hotel: hotel,
                    isExpanded: _isAppBarExpanded,
                    onBack: () => Navigator.pop(context),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HotelBasicInfo(hotel: hotel),
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
}
