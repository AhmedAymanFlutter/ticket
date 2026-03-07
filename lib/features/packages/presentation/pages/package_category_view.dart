import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/packages/data/models/package_type_country_model.dart';
import 'package:ticket/features/packages/presentation/manager/package_countries_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_countries_state.dart';
import 'package:ticket/features/packages/presentation/widgets/category_package_card.dart';
import 'package:ticket/features/packages/presentation/pages/package_details_view.dart';
import 'package:ticket/injection_container.dart';
import 'package:ticket/features/packages/presentation/widgets/buildContactSection_widgets.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_cubit.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_state.dart';
import 'package:ticket/core/helper/contact_helper.dart';

class PackageCategoryView extends StatelessWidget {
  final String categoryTitle;
  final String categorySlug;

  const PackageCategoryView({
    super.key,
    required this.categoryTitle,
    required this.categorySlug,
  });

  static final List<PackageTypeCountryModel> _dummyCountries = List.generate(
    2,
    (index) => PackageTypeCountryModel(
      id: 'dummy_$index',
      name: 'Country Name',
      slug: 'dummy',
      cities: [
        PackageCountryCityModel(id: '1', name: 'City 1'),
        PackageCountryCityModel(id: '2', name: 'City 2'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<PackageCountriesCubit>()
                ..getPackageCountries(categorySlug, languageCode),
        ),
        BlocProvider(
          create: (context) => sl<ContactUsCubit>()..getSettings(languageCode),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: TicketsAppBarDetails(title: categoryTitle, showBack: true),
        body: BlocBuilder<ContactUsCubit, ContactUsState>(
          builder: (context, contactState) {
            String? whatsappUrl;
            String? whatsappNumber;
            String? primaryPhone;

            if (contactState is ContactUsSuccess) {
              whatsappUrl = contactState.settings.socialMedia.whatsApp.url;
              whatsappNumber = ContactHelper.extractPhoneNumber(whatsappUrl);
              primaryPhone = contactState.settings.contactInfo.phones.isNotEmpty
                  ? contactState.settings.contactInfo.phones.first.number
                  : null;
            }

            return BlocBuilder<PackageCountriesCubit, PackageCountriesState>(
              builder: (context, state) {
                final bool isLoading = state is PackageCountriesLoading;
                final List<PackageTypeCountryModel> displayList =
                    state is PackageCountriesSuccess
                    ? state.countries
                    : _dummyCountries;

                if (state is PackageCountriesFailure) {
                  return CustomErrorWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<PackageCountriesCubit>().getPackageCountries(
                        categorySlug,
                        languageCode,
                      );
                      context.read<ContactUsCubit>().getSettings(languageCode);
                    },
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Header Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              'packages.explore_world'.tr(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textcolor,
                                fontFamily: 'Madani Arabic',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'packages.explore_world_desc'.tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF8A8A8A),
                                fontFamily: 'Madani Arabic',
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      // List Section
                      Skeletonizer(
                        enabled: isLoading,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: displayList.isEmpty && !isLoading
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 40.h),
                                      Icon(
                                        Icons.beach_access_outlined,
                                        size: 64.sp,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'packages.no_packages_found'.tr(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.grey[600],
                                          fontFamily: 'Madani Arabic',
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<PackageCountriesCubit>()
                                              .getPackageCountries(
                                                categorySlug,
                                                context.locale.languageCode,
                                              );
                                          context
                                              .read<ContactUsCubit>()
                                              .getSettings(languageCode);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'common.retry'.tr(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: displayList
                                      .map(
                                        (country) => CategoryPackageCard(
                                          imageUrl:
                                              country.imageCover ??
                                              'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa',
                                          categoryBadge:
                                              'packages.suitable_for_visa'.tr(),
                                          countryName: country.name,
                                          locationText:
                                              country.cities
                                                  .where((c) => c.name != null)
                                                  .toList()
                                                  .isNotEmpty
                                              ? country.cities
                                                    .firstWhere(
                                                      (c) => c.name != null,
                                                    )
                                                    .name!
                                              : '',
                                          cities: country.cities
                                              .where((c) => c.name != null)
                                              .map((c) => c.name!)
                                              .toList(),
                                          buttonText: 'common.view_details'
                                              .tr(),
                                          onPhoneTap: () =>
                                              ContactHelper.launchCall(
                                                primaryPhone ?? '',
                                              ),
                                          onWhatsAppTap: () =>
                                              ContactHelper.launchWhatsApp(
                                                number: whatsappNumber,
                                              ),
                                          onDetailsTap: () {
                                            if (!isLoading) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PackageDetailsView(
                                                        packageTypeSlug:
                                                            categorySlug,
                                                        packageSlug:
                                                            country.slug,
                                                      ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      buildContactSection(whatsappNumber: whatsappNumber),
                      SizedBox(height: 24.h),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
