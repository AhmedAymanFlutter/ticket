import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
import 'flight_destination_search_sheet.dart';
import 'build_textField_widgets.dart';

class StationSelectionSection extends StatelessWidget {
  const StationSelectionSection({super.key});

  void _selectCity(BuildContext context, bool isFrom) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => BlocProvider.value(
        value: context.read<FlightSearchCubit>(),
        child: FlightDestinationSearchSheet(isFrom: isFrom),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      buildWhen: (previous, current) =>
          previous.fromCity != current.fromCity ||
          previous.toCity != current.toCity,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: buildField(
                    label: 'flights.from',
                    hint: 'flights.departure_station',
                    svgPath: 'assets/icons/flight.svg',
                    width: 135.w,
                    value: state.fromCity?.name,
                    onTap: () => _selectCity(context, true),
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                  child: buildField(
                    label: 'flights.to',
                    hint: 'flights.arrival_station',
                    svgPath: 'assets/icons/flight.svg',
                    width: 135.w,
                    value: state.toCity?.name,
                    onTap: () => _selectCity(context, false),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 3.h,
              child: GestureDetector(
                onTap: () => context.read<FlightSearchCubit>().swapStations(),
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEAE9EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.swap_horiz,
                    size: 16.sp,
                    color: const Color(0xFF282A51),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
