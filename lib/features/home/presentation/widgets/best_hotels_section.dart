import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_cubit.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_state.dart';
import 'package:ticket/features/hotels/presentation/pages/hotel_details_view.dart';
import 'package:ticket/features/hotels/presentation/pages/hotels_view.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_card.dart';
import 'package:ticket/injection_container.dart';

class BestHotelsSection extends StatelessWidget {
  const BestHotelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HotelsCubit>()..getHotels(),
      child: Column(
        children: [
          // Header Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'home.find_perfect_stay'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF161616),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FadeNavigation.pushFade(context, const HotelsView());
                  },
                  child: Text(
                    'common.view_all'.tr(),
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0F0B30),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Hotel List (Horizontal)
          BlocBuilder<HotelsCubit, HotelsState>(
            builder: (context, state) {
              final isLoading = state is HotelsLoading;
              final hotels = state is HotelsSuccess ? state.hotels : [];

              return Skeletonizer(
                enabled: isLoading,
                child: SizedBox(
                  height: 350.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: isLoading ? 3 : hotels.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final hotel = isLoading ? null : hotels[index];

                      return HotelCard(
                        imagePath: hotel?.image ??
                            'https://images.unsplash.com/photo-1566073771259-6a8506099945',
                        title: hotel?.name ?? 'Loading...',
                        location: hotel?.address ?? '...',
                        distance: hotel?.distance ?? '...',
                        price: hotel?.price.toInt() ?? 0,
                        tag: hotel?.ratingWord ?? '...',
                        discount: '',
                        onTap: hotel == null
                            ? null
                            : () {
                                FadeNavigation.pushFade(
                                  context,
                                  HotelDetailsView(hotelId: hotel.hotelId),
                                );
                              },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
