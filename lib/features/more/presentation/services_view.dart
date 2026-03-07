import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/core/widgets/custom_error_widget.dart';
import 'package:ticket/features/more/presentation/widgets/services/service_card.dart';
import 'package:ticket/features/more/presentation/widgets/services/service_detail_sheet.dart';
import 'package:ticket/features/services/data/models/service_model.dart';
import 'package:ticket/features/services/presentation/manager/services_cubit.dart';
import 'package:ticket/features/services/presentation/manager/services_state.dart';
import 'package:ticket/injection_container.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    return BlocProvider(
      create: (context) => sl<ServicesCubit>()..getServices(lang),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
        body: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesFailure) {
              return CustomErrorWidget(
                message: state.message,
                onRetry: () => context.read<ServicesCubit>().getServices(lang),
              );
            }

            final isLoading =
                state is ServicesLoading || state is ServicesInitial;
            final services = (state is ServicesSuccess)
                ? state.services
                : List.generate(
                    6,
                    (index) => const ServiceModel(
                      id: 'skeleton',
                      name: 'Service Name',
                      slug: 'slug',
                      imageCover: '',
                      description: 'Description...',
                      summary: 'Summary...',
                      method: 'method',
                      alt: 'alt',
                    ),
                  );
            final settings = (state is ServicesSuccess) ? state.settings : null;

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),

                    //  Gradient sub-label
                    Center(
                      child: ShaderMask(
                        shaderCallback: (b) => const LinearGradient(
                          colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
                        ).createShader(b),
                        child: Text(
                          'more.services_features'.tr(),
                          style: TextStyle(
                            fontFamily: 'Madani Arabic',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    //  Big title
                    Center(
                      child: Text(
                        'more.services_headline'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Madani Arabic',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1A1A1A),
                          height: 32.6 / 24,
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    //  Cards Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 164 / 194,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, i) {
                        final svc = services[i];
                        return ServiceCard(
                          service: svc,
                          onTap: () {
                            if (settings != null) {
                              showServiceDetailSheet(context, svc, settings);
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: 24.h),
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
