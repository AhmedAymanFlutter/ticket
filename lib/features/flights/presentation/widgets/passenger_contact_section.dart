import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/flight_search_cubit.dart';
import '../manager/flight_search_state.dart';
import 'build_textField_widgets.dart';

class PassengerContactSection extends StatefulWidget {
  const PassengerContactSection({super.key});

  @override
  State<PassengerContactSection> createState() =>
      _PassengerContactSectionState();
}

class _PassengerContactSectionState extends State<PassengerContactSection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<FlightSearchCubit>();
    _emailController.text = cubit.state.email;
    _phoneController.text = cubit.state.phone;

    _emailController.addListener(() {
      cubit.updateEmail(_emailController.text);
    });
    _phoneController.addListener(() {
      cubit.updatePhone(_phoneController.text);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showPassengerPicker() {
    final cubit = context.read<FlightSearchCubit>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('flights.passengers'.tr()),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    cubit.updatePassengerCount(cubit.state.passengerCount - 1);
                    setDialogState(() {});
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text('${cubit.state.passengerCount}'),
                IconButton(
                  onPressed: () {
                    cubit.updatePassengerCount(cubit.state.passengerCount + 1);
                    setDialogState(() {});
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchCubit, FlightSearchState>(
      buildWhen: (previous, current) =>
          previous.passengerCount != current.passengerCount,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: buildField(
                    label: 'flights.passengers',
                    hint: 'flights.passenger_count',
                    svgPath: 'assets/icons/user-group.svg',
                    width: 135.w,
                    value: '${state.passengerCount}',
                    onTap: _showPassengerPicker,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: buildField(
                    label: 'auth.email',
                    hint: 'your@email.com',
                    svgPath: 'assets/photo/mail-02.svg',
                    width: 135.w,
                    controller: _emailController,
                    readOnly: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 160.w,
                child: buildField(
                  label: 'auth.phone',
                  hint: '05xxxxxxxx',
                  width: 135.w,
                  controller: _phoneController,
                  readOnly: false,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
