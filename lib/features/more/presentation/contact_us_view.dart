import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/more/presentation/widgets/contact_us/contact_form.dart';
import 'package:ticket/features/more/presentation/widgets/contact_us/contact_info_cards.dart';
import 'package:ticket/features/more/presentation/widgets/contact_us/connect_with_us.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_cubit.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_state.dart';
import 'package:ticket/injection_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    return BlocProvider(
      create: (context) => sl<ContactUsCubit>()..getSettings(lang),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
        body: BlocBuilder<ContactUsCubit, ContactUsState>(
          builder: (context, state) {
            if (state is ContactUsFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ContactUsCubit>().getSettings(lang),
                      child: Text('common.retry'.tr()),
                    ),
                  ],
                ),
              );
            }

            final isLoading =
                state is ContactUsLoading || state is ContactUsInitial;
            final settings = (state is ContactUsSuccess)
                ? state.settings
                : _getDummySettings();

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),

                    // Header Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'contact.title'.tr(),
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Support Cards (Design 1)
                    ContactInfoCards(settings: settings),

                    SizedBox(height: 32.h),

                    // Book Your Trip CTA
                    _buildBookTripCTA(settings.socialMedia.whatsApp.url),

                    SizedBox(height: 32.h),

                    // Connect With Us (Social Media)
                    ConnectWithUs(socialMedia: settings.socialMedia),

                    SizedBox(height: 32.h),

                    // Contact Form (Design 2)
                    const ContactForm(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBookTripCTA(String whatsappUrl) {
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
      child: Column(
        children: [
          Text(
            'contact.book_trip'.tr(),
            style: TextStyle(
              fontFamily: 'Madani Arabic',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'contact.contact_whatsapp_details'.tr(),
            style: TextStyle(
              fontFamily: 'Madani Arabic',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF666666),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse(whatsappUrl)),
              icon: Icon(Icons.phone_android, color: Colors.white, size: 24.w),
              label: Text(
                'more.contact_whatsapp'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppSettingsModel _getDummySettings() {
    return AppSettingsModel(
      id: 'skeleton',
      contactInfo: ContactInfoModel(
        phones: [
          ContactPhoneModel(
            id: '1',
            number: '+966...',
            label: 'Main',
            isPrimary: true,
            isWhatsApp: true,
            countryCode: '+966',
          ),
        ],
        emails: [
          ContactEmailModel(
            id: '1',
            email: 'support@...',
            label: 'Support',
            isPrimary: true,
            department: 'Support',
          ),
        ],
        addresses: ['Street Address...'],
      ),
      socialMedia: SocialMediaModel(
        facebook: SocialMediaItemModel(name: 'Facebook', url: ''),
        instagram: SocialMediaItemModel(name: 'Instagram', url: ''),
        twitter: SocialMediaItemModel(name: 'Twitter', url: ''),
        whatsApp: SocialMediaItemModel(name: 'WhatsApp', url: ''),
      ),
    );
  }
}
