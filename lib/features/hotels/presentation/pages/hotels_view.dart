import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_cubit.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_state.dart';
import 'package:ticket/features/hotels/presentation/pages/hotel_details_view.dart';
import 'package:ticket/features/hotels/presentation/widgets/hotel_card.dart';
import 'package:ticket/injection_container.dart';
import '../widgets/hotel_search_bar.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HotelsCubit>()..getHotels(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: TicketsAppBarDetails(title: 'hotels.title'.tr(), showBack: true),
        body: BlocBuilder<HotelsCubit, HotelsState>(
          builder: (context, state) {
            if (state is HotelsFailure) {
              return CustomErrorWidget(
                message: state.message,
                onRetry: () => context.read<HotelsCubit>().getHotels(),
              );
            }

            final isLoading = state is HotelsLoading;
            final hotels = state is HotelsSuccess ? state.hotels : [];

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search Section
                    const HotelSearchBar(),

                    SizedBox(height: 24.h),

                    // Hotel List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: isLoading ? 5 : hotels.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
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
                          discount: '', // API doesn't seem to provide this yet
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
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
