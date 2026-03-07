import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/appbarDetails_widgets.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_state.dart';
import 'package:ticket/features/packages/presentation/widgets/package_highlights/package_highlights_section.dart';
import 'package:ticket/features/packages/presentation/widgets/buildProgramSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildDestinationsSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/buildContactSection_widgets.dart';
import 'package:ticket/features/packages/presentation/widgets/package_hero_carousel.dart';
import 'package:ticket/injection_container.dart';

class PackageDetailsView extends StatelessWidget {
  final String packageTypeSlug;
  final String packageSlug;

  const PackageDetailsView({
    super.key,
    required this.packageTypeSlug,
    required this.packageSlug,
  });

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return BlocProvider(
      create: (context) =>
          sl<PackageDetailsCubit>()
            ..getPackageDetails(packageTypeSlug, packageSlug, languageCode),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: TicketsAppBarDetails(
          title: 'packages.package_details'.tr(),
          showBack: true,
        ),
        body: BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
          builder: (context, state) {
            final bool isLoading = state is PackageDetailsLoading;

            if (state is PackageDetailsFailure) {
              return CustomErrorWidget(
                message: state.message,
                onRetry: () =>
                    context.read<PackageDetailsCubit>().getPackageDetails(
                      packageTypeSlug,
                      packageSlug,
                      languageCode,
                    ),
              );
            }

            final branch = state is PackageDetailsSuccess
                ? state.selectedBranch
                : null;

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    const PackageHeroCarousel(),
                    SizedBox(height: 24.h),
                    buildInclusionSection(branch),
                    SizedBox(height: 24.h),
                    buildDestinationsSection(branch?.cities ?? []),
                    SizedBox(height: 24.h),
                    buildProgramSection(branch?.days ?? []),
                    SizedBox(height: 24.h),
                    buildContactSection(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
