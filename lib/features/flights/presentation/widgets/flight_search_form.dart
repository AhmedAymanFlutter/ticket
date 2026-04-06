import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/core/widgets/custom_snackbar.dart';
import 'package:ticket/features/flights/presentation/pages/flight_results_view.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
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
          BlocListener<FlightSearchCubit, FlightSearchState>(
            listenWhen: (previous, current) =>
                previous.isLoadingFlights != current.isLoadingFlights ||
                previous.searchResponse != current.searchResponse ||
                previous.errorMessage != current.errorMessage,
            listener: (context, state) {
              if (!state.isLoadingFlights && state.searchResponse != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (modalContext) => BlocProvider.value(
                      value: context.read<FlightSearchCubit>(),
                      child: const FlightResultsView(),
                    ),
                  ),
                );
              }
              if (state.errorMessage != null) {
                context.showErrorSnackBar(state.errorMessage!);
              }
            },
            child: BlocBuilder<FlightSearchCubit, FlightSearchState>(
              buildWhen: (previous, current) =>
                  previous.isLoadingFlights != current.isLoadingFlights,
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ElevatedButton(
                    onPressed: state.isLoadingFlights
                        ? null
                        : () {
                            context.read<FlightSearchCubit>().searchFlights();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: state.isLoadingFlights
                        ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
