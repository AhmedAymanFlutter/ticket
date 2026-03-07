import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/activities/presentation/pages/activity_details_view.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_card/activity_card_info.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_card/widgets/activity_card_footer.dart';
import 'package:ticket/features/activities/presentation/widgets/activity_card/widgets/activity_card_image.dart';
import 'package:ticket/features/tours/data/models/tour_model.dart';

class ActivityCard extends StatelessWidget {
  final TourModel? tour;
  const ActivityCard({super.key, this.tour});

  @override
  Widget build(BuildContext context) {
    // Determine dynamic properties from the tour model.
    final String imageUrl = tour?.coverImage ?? '';
    final String titleStr = tour?.title ?? 'activities.boat_trip_title'.tr();
    final String locationStr =
        tour?.cityName ?? 'activities.location_jeddah'.tr();
    final num ratingAvg = tour?.ratingAverage ?? 4.6;
    final int ratingCount = tour?.ratingCount ?? 570;
    final num priceAmount = tour?.priceAmount ?? 2500;

    // We maintain default text translations if properties are empty
    final String durationText = 'activities.duration_2h'.tr();
    final String confirmationText =
        tour?.cancellationPolicy ?? 'activities.instant_confirmation'.tr();

    return InkWell(
      onTap: () {
        if (tour?.productCode != null) {
          FadeNavigation.pushFade(
            context,
            ActivityDetailsView(productCode: tour!.productCode!),
          );
        }
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 343.w,
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityCardImage(imageUrl: imageUrl),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActivityCardInfo(
                    title: titleStr,
                    durationText: durationText,
                    confirmationText: confirmationText,
                    locationText: locationStr,
                  ),
                  SizedBox(height: 12.h),
                  const Divider(height: 1, color: Color(0xFFEAE9EB)),
                  SizedBox(height: 16.h),
                  ActivityCardFooter(
                    ratingCount: ratingCount,
                    ratingAvg: ratingAvg,
                    priceAmount: priceAmount,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
