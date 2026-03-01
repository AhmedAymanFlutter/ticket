import 'package:skeletonizer/skeletonizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/travel_guide/data/datasources/travel_guide_remote_data_source.dart';
import 'package:ticket/features/travel_guide/data/repositories/travel_guide_repository.dart';
import 'package:ticket/features/travel_guide/data/models/country_model.dart';
import 'package:ticket/features/travel_guide/presentation/widgets/guide_card.dart';

class TravelGuideView extends StatefulWidget {
  const TravelGuideView({super.key});

  @override
  State<TravelGuideView> createState() => _TravelGuideViewState();
}

class _TravelGuideViewState extends State<TravelGuideView> {
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
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: FutureBuilder<ApiResponse<List<CountryModel>>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final countries =
              snapshot.data?.data ??
              List.generate(
                3,
                (index) => CountryModel(
                  nameAr: 'اسم الدولة',
                  description: 'هذا نص تجريبي لوصف الدولة، سيظهر كـ skeleton',
                  continentAr: 'القارة',
                  imageCover: '',
                  slug: '',
                ),
              );

          if (!isLoading &&
              (snapshot.hasError ||
                  snapshot.data == null ||
                  !snapshot.data!.isSuccess)) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('contact.error_message'.tr()),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _countriesFuture = _repository.getCountries();
                      });
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!isLoading && countries.isEmpty) {
            return Center(child: Text('No countries found'));
          }

          return Skeletonizer(
            enabled: isLoading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Internal Header
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'about.guide_header_title'.tr(),
                          style: TextStyle(
                            color: const Color(0xFF1A1A1A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Madani Arabic',
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'about.guide_header_subtitle'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF676768),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.6,
                            fontFamily: 'Madani Arabic',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // List of Cards
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      final country = countries[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: GuideCard(
                          title: country.displayName,
                          description: country.description ?? '',
                          tag1: country.displayContinent,
                          tag2: 'about.guide_trending'.tr(),
                          imagePath: country.imageCover ?? '',
                          slug: country.slug ?? '',
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
