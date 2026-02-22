import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/more/presentation/widgets/services/service_card.dart';
import 'package:ticket/features/more/presentation/widgets/services/service_detail_sheet.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  static List<ServiceItem> _buildServices(BuildContext context) {
    return [
      ServiceItem(
        icon: 'assets/icons/services.svg',
        label: 'more.service_car_rental'.tr(),
        description: 'more.service_car_rental_desc'.tr(),
        howToUse: 'more.service_how_to_use_default'.tr(),
      ),
      ServiceItem(
        icon: 'assets/icons/boat2.svg',
        label: 'more.service_boat_trips'.tr(),
        description: 'more.service_boat_trips_desc'.tr(),
        howToUse: 'more.service_how_to_use_default'.tr(),
      ),
      ServiceItem(
        icon: 'assets/icons/document-validation.svg',
        label: 'more.service_driving_license'.tr(),
        description: 'more.service_driving_license_desc'.tr(),
        howToUse: 'more.service_how_to_use_default'.tr(),
      ),
      ServiceItem(
        icon: 'assets/icons/flight.svg',
        label: 'more.service_book_flight'.tr(),
        description: 'more.service_book_flight_desc'.tr(),
        howToUse: 'more.service_how_to_use_default'.tr(),
      ),
      ServiceItem(
        icon: 'assets/icons/tour_guide.svg',
        label: 'more.service_programs'.tr(),
        description: 'more.service_programs_desc'.tr(),
        howToUse: 'more.service_how_to_use_default'.tr(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final services = _buildServices(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),

            //  Gradient sub-label
            Center(
              child: ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                ).createShader(b),
                child: Text(
                  'more.services_features'.tr(),
                  style: TextStyle(
                    fontFamily: 'Madani Arabic',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            //  Big title
            Text(
              'more.services_headline'.tr(),
              textAlign: TextAlign.center,

              style: TextStyle(
                fontFamily: 'Madani Arabic',
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1A1A1A),
                height: 32.6 / 24,
              ),
            ),

            SizedBox(height: 24.h),

            //  Cards Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 164 / 194,
              ),
              itemCount: services.length,
              itemBuilder: (context, i) {
                final svc = services[i];
                return ServiceCard(
                  icon: svc.icon,
                  label: svc.label,
                  onTap: () => showServiceDetailSheet(context, svc),
                );
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
