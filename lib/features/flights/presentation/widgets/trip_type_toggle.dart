import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
import 'build_toogelItem_widgets.dart';

class TripTypeToggle extends StatelessWidget {
  const TripTypeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      buildWhen: (previous, current) =>
          previous.isRoundTrip != current.isRoundTrip,
      builder: (context, state) {
        return Container(
          height: 44.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(33.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              buildToggleItem(
                title: 'flights.round_trip',
                isSelected: state.isRoundTrip,
                onTap: () =>
                    context.read<FlightSearchCubit>().toggleTripType(true),
                icon: SvgPicture.asset(
                  'assets/icons/roundTrip.svg',
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                isSelectedStyle: true,
              ),
              buildToggleItem(
                title: 'flights.one_way',
                isSelected: !state.isRoundTrip,
                onTap: () =>
                    context.read<FlightSearchCubit>().toggleTripType(false),
                icon: SvgPicture.asset(
                  'assets/icons/oneWay.svg',
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                isSelectedStyle: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
