import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/widgets/TicketsAppBar_widget.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/bottom_action.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/features_section.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/intro_section.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/mission_section.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/stats_section.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/vision_section.dart';
import 'package:ticket/features/more/presentation/widgets/about_us/values_section.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: TicketsAppBar(subtitle: 'more.ready_trip'.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xFF282A50),
              child: const Column(
                children: [
                  AboutUsIntroSection(),
                  AboutUsVisionSection(),
                  AboutUsMissionSection(),
                ],
              ),
            ),
            // ── Transition Section (Dark Blue behind top of Stats) ─────────────
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 100.h, // Height of the background overlap
                  child: Container(color: const Color(0xFF282A50)),
                ),
                const AboutUsStatsSection(),
              ],
            ),
            const AboutUsFeaturesSection(),
            const AboutUsValuesSection(),
            const AboutUsBottomAction(),
          ],
        ),
      ),
    );
  }
}
