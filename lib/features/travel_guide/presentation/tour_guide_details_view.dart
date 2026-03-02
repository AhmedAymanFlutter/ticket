import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:ticket/features/travel_guide/data/datasources/travel_guide_remote_data_source.dart';
import 'package:ticket/features/travel_guide/data/models/country_model.dart';
import 'package:ticket/features/travel_guide/data/repositories/travel_guide_repository.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_hero_section.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_info_section.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_section_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/travel_guide/presentation/manager/travel_guide_details_cubit.dart';
import 'package:ticket/features/travel_guide/presentation/manager/travel_guide_details_state.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/models/place_item.dart';
import 'package:ticket/injection_container.dart';

/// The main orchestrator view for the Tour Guide Details page.
/// Follows Clean Architecture by delegating UI sections to specialized widgets.
class TourGuideDetailsView extends StatefulWidget {
  final String countrySlug;
  const TourGuideDetailsView({super.key, required this.countrySlug});

  @override
  State<TourGuideDetailsView> createState() => _TourGuideDetailsViewState();
}

class _TourGuideDetailsViewState extends State<TourGuideDetailsView> {
  late Future<ApiResponse<CountryModel>> _detailsFuture;
  final _repository = TravelGuideRepository(
    TravelGuideRemoteDataSource(APIHelper()),
  );

  @override
  void initState() {
    super.initState();
    _detailsFuture = _repository.getCountryDetails(widget.countrySlug);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TravelGuideDetailsCubit>()..getGuideDetails(widget.countrySlug),
      child: FutureBuilder<ApiResponse<CountryModel>>(
        future: _detailsFuture,
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final country = snapshot.data?.data;

          return Scaffold(
            backgroundColor: const Color(0xFFF9F9F9),
            appBar: TicketsAppBarDetails(
              title: isLoading
                  ? '...'
                  : (country?.displayName ?? 'تفاصيل الوجهة'),
              showBack: true,
            ),
            body: Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ── Hero Section (Image + Title + Info Chips)
                    GuideHeroSection(country: country),
                    SizedBox(height: 16.h),

                    // ── Main Info Section (Description + Detailed Info Cards)
                    GuideInfoSection(country: country),
                    SizedBox(height: 24.h),

                    // ── Cities slider
                    GuideSectionSlider(
                      title: 'أهم المدن',
                      subtitle:
                          'اكتشف أبرز المناطق السياحية وأكثر الأماكن زيارة.',
                      places:
                          country?.cities
                              ?.map<PlaceItem>(
                                (city) => PlaceItem(
                                  name: city.name ?? '',
                                  imageUrl: city.imageCover ?? '',
                                  desc: '',
                                ),
                              )
                              .toList() ??
                          [],
                    ),

                    // ── Guide Sections (From Bloc)
                    BlocBuilder<
                      TravelGuideDetailsCubit,
                      TravelGuideDetailsState
                    >(
                      builder: (context, state) {
                        if (state is TravelGuideDetailsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is TravelGuideDetailsSuccess) {
                          final guide = state.guide;
                          return Column(
                            children: [
                              if (guide.restaurants.isNotEmpty) ...[
                                SizedBox(height: 24.h),
                                GuideSectionSlider(
                                  title:
                                      'أفضل المطاعم في ${country?.displayName ?? ''}',
                                  subtitle:
                                      'اكتشف تجارب طعام متنوعة تشمل المطاعم الشهيرة والوجبات التقليدية.',
                                  places: guide.restaurants
                                      .map(
                                        (e) => PlaceItem(
                                          name: e.name,
                                          imageUrl: e.coverImage ?? '',
                                          desc: e.description ?? '',
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                              if (guide.placesToVisit.isNotEmpty) ...[
                                SizedBox(height: 24.h),
                                GuideSectionSlider(
                                  title:
                                      'أفضل المعالم في ${country?.displayName ?? ''}',
                                  subtitle:
                                      'اكتشف أبرز المناطق السياحية وأكثر الأماكن زيارة في المنطقة.',
                                  places: guide.placesToVisit
                                      .map(
                                        (e) => PlaceItem(
                                          name: e.name,
                                          imageUrl: e.coverImage ?? '',
                                          desc: e.description ?? '',
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                              if (guide.thingsToDo.isNotEmpty) ...[
                                SizedBox(height: 24.h),
                                GuideSectionSlider(
                                  title:
                                      'أفضل الأنشطة في ${country?.displayName ?? ''}',
                                  subtitle:
                                      'استمتع بتجارب متنوعة تشمل المعالم الشهيرة، والتسوق، والأنشطة الترفيهية الفريدة.',
                                  places: guide.thingsToDo
                                      .map(
                                        (e) => PlaceItem(
                                          name: e.name,
                                          imageUrl: e.coverImage ?? '',
                                          desc: e.description ?? '',
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
