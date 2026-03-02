import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/activities/presentation/widgets/activities_filters.dart';
import 'package:ticket/features/activities/presentation/widgets/activities_search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/activities/presentation/widgets/city_filter_sheet.dart';
import 'package:ticket/features/activities/presentation/widgets/price_filter_sheet.dart';
import 'package:ticket/features/activities/presentation/widgets/activities_tours_list.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ActivitiesBody();
  }
}

class _ActivitiesBody extends StatefulWidget {
  const _ActivitiesBody();

  @override
  State<_ActivitiesBody> createState() => _ActivitiesBodyState();
}

class _ActivitiesBodyState extends State<_ActivitiesBody> {
  final ScrollController _scrollController = ScrollController();

  String? _selectedCitySlug;
  String? _selectedCityName;
  int? _minPrice;
  int? _maxPrice;
  String? _currentSearchQuery;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ToursCubit>().getTours(context.locale.languageCode);
        context.read<CitiesCubit>().getCities();
      }
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      context.read<ToursCubit>().fetchMoreTours();
    }
  }

  void _triggerSearch(String lang) {
    context.read<ToursCubit>().getTours(
      lang,
      search: _currentSearchQuery,
      city: _selectedCitySlug,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
    );
  }

  void _showCityFilterSheet(String lang) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (bgContext) {
        return BlocProvider.value(
          value: context.read<CitiesCubit>(),
          child: CityFilterBottomSheet(
            selectedCitySlug: _selectedCitySlug,
            onCitySelected: (slug, name) {
              setState(() {
                if (_selectedCitySlug == slug) {
                  _selectedCitySlug = null;
                  _selectedCityName = null;
                } else {
                  _selectedCitySlug = slug;
                  _selectedCityName = name;
                }
              });
              Navigator.pop(bgContext);
              _triggerSearch(lang);
            },
          ),
        );
      },
    );
  }

  void _showPriceFilterSheet(String lang) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (bgContext) {
        return PriceFilterBottomSheet(
          initialMinPrice: _minPrice,
          initialMaxPrice: _maxPrice,
          onApply: (minPrice, maxPrice) {
            setState(() {
              _minPrice = minPrice;
              _maxPrice = maxPrice;
            });
            Navigator.pop(bgContext);
            _triggerSearch(lang);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String lang = context.locale.languageCode;

    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            ActivitiesSearchBar(
              onSearch: (value) {
                _currentSearchQuery = value;
                _triggerSearch(lang);
              },
            ),
            // Title Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'activities.explore_title'.tr(),
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'activities.offers_count'.tr(namedArgs: {'count': '76'}),
                    style: TextStyle(
                      color: const Color(0xFF8A8A8A),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Filters
            ActivitiesFilters(
              selectedCity: _selectedCityName,
              selectedMinPrice: _minPrice,
              selectedMaxPrice: _maxPrice,
              onCityTapped: () => _showCityFilterSheet(lang),
              onPriceTapped: () => _showPriceFilterSheet(lang),
            ),
            SizedBox(height: 24.h),

            // Activity Cards List
            const ActivitiesToursList(),
            SizedBox(height: 100.h), // Bottom nav bar spacing
          ],
        ),
      ),
    );
  }
}
