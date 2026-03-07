import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ticket/features/more/presentation/widgets/contact_us/ContactItem_widgets.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';
import 'package:ticket/core/helper/contact_helper.dart';

class ContactInfoCards extends StatelessWidget {
  final AppSettingsModel settings;

  const ContactInfoCards({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: ContactItem(
                iconPath: 'assets/photo/mail-02.svg',
                fallbackIcon: Icons.email_outlined,
                title: 'contact.support_service'.tr(),
                details: settings.contactInfo.emails
                    .map((e) => e.email)
                    .toList(),
                onTap: (email) => ContactHelper.launchEmail(email),
              ),
            ),
            VerticalDivider(
              width: 32.w,
              thickness: 1,
              color: const Color(0xFFEEEEEE),
            ),
            Expanded(
              child: ContactItem(
                iconPath: 'assets/icons/customer-service.svg',
                fallbackIcon: Icons.phone_outlined,
                title: 'contact.support_team'.tr(),
                details: settings.contactInfo.phones
                    .map((p) => p.number)
                    .toList(),
                onTap: (phone) => ContactHelper.launchCall(phone),
              ),
            ),
            VerticalDivider(
              width: 32.w,
              thickness: 1,
              color: const Color(0xFFEEEEEE),
            ),
            Expanded(
              child: ContactItem(
                iconPath: 'assets/icons/location.svg',
                fallbackIcon: Icons.location_on_outlined,
                title: 'contact.visit_office'.tr(),
                details: settings.contactInfo.addresses,
                onTap: (address) => ContactHelper.launchMap(address),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
