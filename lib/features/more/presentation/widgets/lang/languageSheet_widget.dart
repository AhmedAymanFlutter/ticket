import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/features/more/presentation/widgets/lang/lang_selections_widgets.dart';

/// Shows a small positioned dropdown (165×136) matching the design specs:
/// border-radius: 8, border: #EAE9EB, box-shadow: 0px 24px 48px -12 #1018282E
void showLanguageDropdown(BuildContext context, Offset position) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: (_, anim, __, child) =>
        FadeTransition(opacity: anim, child: child),
    pageBuilder: (dialogContext, _, __) {
      return Stack(
        children: [
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Material(
              color: Colors.transparent,
              child: _LanguageDropdown(
                onSelected: () => Navigator.pop(dialogContext),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class _LanguageDropdown extends StatelessWidget {
  final VoidCallback onSelected;
  const _LanguageDropdown({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final String selected = context.locale.languageCode;

    return Container(
      width: 165.w,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFEAE9EB), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2E101828),
            blurRadius: 48,
            spreadRadius: -12,
            offset: Offset(0, 24),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title ──────────────────────────────────────────────
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'more.choose_language'.tr(),
              style: TextStyle(
                fontFamily: 'Madani Arabic',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF8F8F8F),
              ),
            ),
          ),

          SizedBox(height: 4.h),

          // ── Arabic ─────────────────────────────────────────────
          LanguageOption(
            label: 'العربية',
            isSelected: selected == 'ar',
            onTap: () async {
              await context.setLocale(const Locale('ar'));
              onSelected();
            },
          ),

          // ── English ────────────────────────────────────────────
          LanguageOption(
            label: 'English',
            isSelected: selected == 'en',
            onTap: () async {
              await context.setLocale(const Locale('en'));
              onSelected();
            },
          ),
        ],
      ),
    );
  }
}

/// Legacy class kept for compatibility
class LanguageSheet extends StatefulWidget {
  const LanguageSheet({super.key});
  @override
  State<LanguageSheet> createState() => LanguageSheetState();
}

class LanguageSheetState extends State<LanguageSheet> {
  @override
  Widget build(BuildContext context) {
    return const _LanguageDropdown(onSelected: _noop);
  }

  static void _noop() {}
}
