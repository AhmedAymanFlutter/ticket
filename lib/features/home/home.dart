import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/home/presentation/widgets/best_destinations_section.dart';
import 'package:ticket/features/home/presentation/widgets/best_hotels_section.dart';
import 'package:ticket/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:ticket/features/home/presentation/widgets/home_header.dart';
import 'package:ticket/features/home/presentation/widgets/plan_adventure_section.dart';
import 'package:ticket/features/home/presentation/widgets/reviews_section.dart';
import 'package:ticket/features/home/presentation/widgets/special_offers_section.dart';

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
      const Center(child: Text('Packages Page')),
      const Center(child: Text('Flights Page')),
      const Center(child: Text('Activities Page')),
      const Center(child: Text('More Page')),
    ];

    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
