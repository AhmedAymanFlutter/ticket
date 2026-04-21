import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/simple_destination_card.dart';
import 'package:ticket/core/widgets/horizontal_skeleton_list.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/travel_guide/data/datasources/travel_guide_remote_data_source.dart';
import 'package:ticket/features/travel_guide/data/repositories/travel_guide_repository.dart';
import 'package:ticket/features/travel_guide/data/models/country_model.dart';
import 'package:ticket/features/travel_guide/presentation/travel_guide_view.dart';
import 'package:ticket/features/travel_guide/presentation/tour_guide_details_view.dart';

class BestDestinationsSection extends StatefulWidget {
  const BestDestinationsSection({super.key});

  @override
  State<BestDestinationsSection> createState() =>
      _BestDestinationsSectionState();
}

class _BestDestinationsSectionState extends State<BestDestinationsSection> {
  late Future<ApiResponse<List<CountryModel>>> _countriesFuture;
  final _repository = TravelGuideRepository(
    TravelGuideRemoteDataSource(APIHelper()),
  );

  @override
  void initState() {
    super.initState();
    _countriesFuture = _repository.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home.best_destinations'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF161616),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TravelGuideView(),
                    ),
                  );
                },
                child: Text(
                  'common.view_all'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B6E82),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // List
        SizedBox(
          height: 110.h,
          child: FutureBuilder<ApiResponse<List<CountryModel>>>(
            future: _countriesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return HorizontalSkeletonList(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Container(
                        width: 144.w,
                        height: 95.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError ||
                  snapshot.data == null ||
                  !snapshot.data!.isSuccess) {
                return CustomErrorWidget(
                  message:
                      snapshot.data?.message ?? 'contact.error_message'.tr(),
                  onRetry: () {
                    setState(() {
                      _countriesFuture = _repository.getCountries();
                    });
                  },
                );
              }

              final countries = snapshot.data?.data ?? [];

              if (countries.isEmpty) {
                return const Center(child: Text('No destinations available'));
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                scrollDirection: Axis.horizontal,
                itemCount: countries.length,
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TourGuideDetailsView(
                            countrySlug: country.slug ?? '',
                          ),
                        ),
                      );
                    },
                    child: SimpleDestinationCard(
                      imagePath:
                          (country.imageCover != null &&
                              country.imageCover!.isNotEmpty)
                          ? country.imageCover!
                          : 'https://images.unsplash.com/photo-1544551763-46a013bb70d5',
                      title: country.getName(context.locale.languageCode),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
