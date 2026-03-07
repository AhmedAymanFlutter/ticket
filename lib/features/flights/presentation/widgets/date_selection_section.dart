import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
import 'build_textField_widgets.dart';

class DateSelectionSection extends StatelessWidget {
  const DateSelectionSection({super.key});

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (isDeparture) {
        context.read<FlightSearchCubit>().updateDepartureDate(picked);
      } else {
        context.read<FlightSearchCubit>().updateReturnDate(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      buildWhen: (previous, current) =>
          previous.departureDate != current.departureDate ||
          previous.returnDate != current.returnDate ||
          previous.isRoundTrip != current.isRoundTrip,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: buildField(
                label: 'flights.departure_date',
                hint: 'mm-dd-yyyy',
                svgPath: 'assets/photo/calendar-02.svg',
                width: 135.w,
                insideIcon: SvgPicture.asset('assets/photo/calendar-02.svg'),
                value: state.departureDate != null
                    ? DateFormat('dd-MM-yyyy').format(state.departureDate!)
                    : null,
                onTap: () => _selectDate(context, true),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Opacity(
                opacity: state.isRoundTrip ? 1.0 : 0.5,
                child: buildField(
                  label: 'flights.return_date',
                  hint: 'mm-dd-yyyy',
                  width: 135.w,
                  insideIcon: SvgPicture.asset('assets/photo/calendar-02.svg'),
                  svgPath: 'assets/photo/calendar-02.svg',
                  value: state.returnDate != null
                      ? DateFormat('dd-MM-yyyy').format(state.returnDate!)
                      : null,
                  onTap: state.isRoundTrip
                      ? () => _selectDate(context, false)
                      : null,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
