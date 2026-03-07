import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/flight_search_cubit.dart';
import 'trip_type_toggle.dart';
import 'station_selection_section.dart';
import 'date_selection_section.dart';
import 'passenger_contact_section.dart';

class FlightSearchForm extends StatelessWidget {
  const FlightSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 480.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.93), Colors.white],
          stops: const [0.0775, 1.0],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x17000000),
            blurRadius: 7.3,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          const TripTypeToggle(),
          SizedBox(height: 20.h),
          const StationSelectionSection(),
          SizedBox(height: 16.h),
          const DateSelectionSection(),
          SizedBox(height: 16.h),
          const PassengerContactSection(),
          const Spacer(),
          // Submit Button
          Container(
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ElevatedButton(
              onPressed: () {
                context.read<FlightSearchCubit>().submitRequest();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('flights.request_sent'.tr())),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'flights.send_request'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Madani Arabic',
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.near_me_outlined,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
