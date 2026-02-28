import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/packages/data/models/package_type_model.dart';
import 'package:ticket/features/packages/presentation/manager/package_types_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_types_state.dart';
import 'package:ticket/features/packages/presentation/pages/package_category_view.dart';
import 'package:ticket/features/packages/presentation/widgets/package_card.dart';

import 'package:skeletonizer/skeletonizer.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  static final List<PackageTypeModel> _dummyPackages = List.generate(
    3,
    (index) => PackageTypeModel(
      id: 'dummy_$index',
      name: 'Package Name Placeholder',
      description:
          'This is a description placeholder for the skeleton loading effect.',
      slug: 'dummy',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: BlocBuilder<PackageTypesCubit, PackageTypesState>(
        builder: (context, state) {
          final bool isLoading = state is PackageTypesLoading;
          final List<PackageTypeModel> displayList =
              state is PackageTypesSuccess
              ? state.packageTypes
              : _dummyPackages;

          if (state is PackageTypesFailure) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return Skeletonizer(
            enabled: isLoading,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                children: [
                  displayList.isEmpty && !isLoading
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 80.h),
                              Icon(
                                Icons.category_outlined,
                                size: 64.sp,
                                color: Colors.grey[400],
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'packages.no_categories_found'.tr(),
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
                                      .read<PackageTypesCubit>()
                                      .getPackageTypes(
                                        context.locale.languageCode,
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'common.retry'.tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            // Title Section
                            Center(
                              child: Text(
                                'packages.title'.tr(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textcolor,
                                  fontFamily: 'Madani Arabic',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'packages.description'.tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                                fontFamily: 'Madani Arabic',
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32.h),

                            ...displayList.map(
                              (type) => PackageCard(
                                imageUrl:
                                    type.imageCover ??
                                    'https://images.unsplash.com/photo-1436491865332-7a61a109cc05', // Default image
                                title: type.name,
                                subtitle: type.description,
                                buttonText: 'packages.explore_now'.tr(),
                                onExplore: () {
                                  if (!isLoading) {
                                    FadeNavigation.pushFade(
                                      context,
                                      PackageCategoryView(
                                        categoryTitle: type.name,
                                        categorySlug: type.slug,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),

                  SizedBox(height: 100.h), // Extra space for bottom nav bar
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
