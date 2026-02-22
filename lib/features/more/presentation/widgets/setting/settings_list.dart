import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/more/presentation/widgets/setting/settingsRow_widgets.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // #0000001A
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ─── Title ─────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'more.settings'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF666666),
                ),
              ),
            ),
          ),

          //Rows
          SettingsRow(
            icon: 'assets/icons/customer-service.svg',
            label: 'more.contact_us'.tr(),
            isDestructive: false,
            onTap: () {},
            showDivider: true,
          ),
          SizedBox(height: 30.h),
          SettingsRow(
            icon: 'assets/icons/document-validation.svg',
            label: 'more.terms'.tr(),
            isDestructive: false,
            onTap: () {},
            showDivider: true,
          ),
          SizedBox(height: 30.h),
          SettingsRow(
            icon: 'assets/icons/logout-01.svg',
            label: 'more.logout'.tr(),
            isDestructive: true,
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
