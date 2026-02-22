import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/navigation/fade_navigation.dart';
import 'package:ticket/features/more/presentation/services_view.dart';
import 'package:ticket/features/more/presentation/about_us_view.dart';
import 'package:ticket/features/travel_guide/presentation/travel_guide_view.dart';
import 'package:ticket/features/hotels/presentation/pages/hotels_view.dart';
import 'package:ticket/features/more/presentation/widgets/quickActions/QuickActionItem_Widgets.dart';
import 'package:ticket/features/more/presentation/widgets/lang/languageSheet_widget.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  void _showLanguageDropdown(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    showLanguageDropdown(
      context,
      Offset(offset.dx, offset.dy + box.size.height + 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<QuickActionItem> items = [
      QuickActionItem(
        icon: 'assets/photo/ticket.png',
        label: 'more.about_us'.tr(),
        onTap: () => FadeNavigation.pushFade(context, const AboutUsView()),
        isPng: true,
      ),
      QuickActionItem(
        icon: 'assets/icons/hotel.svg',
        label: 'more.hotels'.tr(),
        onTap: () => FadeNavigation.pushFade(context, const HotelsView()),
      ),

      QuickActionItem(
        icon: 'assets/icons/services.svg',
        label: 'more.services'.tr(),
        onTap: () => FadeNavigation.pushFade(context, const ServicesView()),
      ),
      QuickActionItem(
        icon: 'assets/icons/tour_guide.svg',
        label: 'more.travel_guide'.tr(),
        onTap: () => FadeNavigation.pushFade(context, const TravelGuideView()),
      ),

      QuickActionItem(
        icon: 'assets/icons/boat2.svg',
        label: 'more.flights'.tr(),
        onTap: () {},
      ),
      QuickActionItem(
        icon: 'assets/icons/translate.svg',
        label: 'more.language'.tr(),
        onTap: () => _showLanguageDropdown(context),
        trailing: context.locale.languageCode == 'ar' ? 'العربية' : 'English',
      ),
    ];

    return Container(
      width: 343.w,
      // height auto — let content decide (308.h as reference)
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000), // #0000001A
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 149.5 / 84,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return QuickActionCard(item: items[index]);
        },
      ),
    );
  }
}
