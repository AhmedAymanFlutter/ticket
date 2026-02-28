import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/flights/presentation/pages/flights_view.dart';
import 'package:ticket/features/activities/presentation/pages/activities_view.dart';
import 'package:ticket/features/home/presentation/widgets/best_destinations_section.dart';
import 'package:ticket/features/home/presentation/widgets/best_hotels_section.dart';
import 'package:ticket/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:ticket/features/home/presentation/widgets/home_header.dart';
import 'package:ticket/features/home/presentation/widgets/plan_adventure_section.dart';
import 'package:ticket/features/home/presentation/widgets/reviews_section.dart';
import 'package:ticket/features/home/presentation/widgets/special_offers_section.dart';
import 'package:ticket/features/more/presentation/more_view.dart';
import 'package:ticket/features/packages/presentation/pages/packages_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/injection_container.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/home/presentation/manager/cities_state.dart';
import 'package:ticket/features/home/presentation/manager/offers_cubit.dart';
import 'package:ticket/features/home/presentation/manager/offers_state.dart';
import 'package:ticket/features/packages/presentation/manager/package_types_cubit.dart';

import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            SizedBox(height: 24.h),
            BestDestinationsSection(),
            SizedBox(height: 24.h),
            SpecialOffersSection(),
            SizedBox(height: 24.h),
            BestHotelsSection(),
            SizedBox(height: 24.h),
            PlanAdventureSection(),
            SizedBox(height: 24.h),
            ReviewsSection(),
            SizedBox(height: 120.h),
          ],
        ),
      ),
      const PackagesView(),
      const FlightsView(),
      const ActivitiesView(),
      const MoreView(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CitiesCubit>()),
        BlocProvider(create: (context) => sl<OffersCubit>()),
        BlocProvider(create: (context) => sl<PackageTypesCubit>()),
        BlocProvider(create: (context) => sl<ToursCubit>()),
      ],
      child: Builder(
        builder: (context) {
          final String lang = context.locale.languageCode;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && _currentIndex == 0) {
              final citiesCubit = context.read<CitiesCubit>();
              final offersCubit = context.read<OffersCubit>();

              if (citiesCubit.state is CitiesInitial) {
                citiesCubit.getCities(lang);
              }
              if (offersCubit.state is OffersInitial) {
                offersCubit.getOffers(lang);
              }
            }
          });

          return Scaffold(
            extendBody: true,
            body: IndexedStack(index: _currentIndex, children: pages),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });

                // Refresh logic on tab switch
                if (index == 0) {
                  context.read<CitiesCubit>().getCities(lang);
                  context.read<OffersCubit>().getOffers(lang);
                } else if (index == 1) {
                  context.read<PackageTypesCubit>().getPackageTypes(lang);
                } else if (index == 3) {
                  context.read<ToursCubit>().getTours(lang);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
