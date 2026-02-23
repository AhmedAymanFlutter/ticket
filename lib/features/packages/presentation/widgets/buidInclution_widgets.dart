import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/utils/app_colors.dart';

class BuildInclusionSection extends StatefulWidget {
  const BuildInclusionSection({super.key});

  @override
  State<BuildInclusionSection> createState() => _BuildInclusionSectionState();
}

class _BuildInclusionSectionState extends State<BuildInclusionSection> {
  bool _withAccommodation = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 8.w),

              Text(
                'أبرز مميزات الباقة',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Madani Arabic',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // ─── Toggle Buttons ──────────────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // "بدون إقامة" button
              GestureDetector(
                onTap: () => setState(() => _withAccommodation = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: _withAccommodation
                        ? Colors.white
                        : const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: _withAccommodation
                          ? const Color(0xFFE5E7EB)
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'بدون إقامه',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: _withAccommodation
                              ? const Color(0xFF6B7280)
                              : AppColors.primary,
                          fontFamily: 'Madani Arabic',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.hotel_outlined,
                        size: 18.sp,
                        color: _withAccommodation
                            ? const Color(0xFF6B7280)
                            : AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // "مع توفير إقامة" button (active)
              GestureDetector(
                onTap: () => setState(() => _withAccommodation = true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: _withAccommodation
                        ? const LinearGradient(
                            colors: [Color(0xFFFF5252), Color(0xFFFD6B38)],
                          )
                        : null,
                    color: _withAccommodation ? null : const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'مع توفير إقامة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: _withAccommodation
                              ? Colors.white
                              : const Color(0xFF6B7280),
                          fontFamily: 'Madani Arabic',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.smartphone_outlined,
                        size: 18.sp,
                        color: _withAccommodation
                            ? Colors.white
                            : const Color(0xFF6B7280),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // ─── Inclusion Checklist Card ────────────────────────────────────────
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _withAccommodation
              ? _buildWithAccommodationCard()
              : _buildWithoutAccommodationCard(),
        ),
        SizedBox(height: 16.h),

        // ─── Review / Ideal Card ─────────────────────────────────────────────
        _buildIdealCard(),
        SizedBox(height: 16.h),

        // ─── Overview Card ───────────────────────────────────────────────────
        _buildOverviewCard(),
      ],
    );
  }

  Widget _buildWithAccommodationCard() {
    return Container(
      key: const ValueKey('with'),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'تتضمن الاقامة الكاملة ما يلي:',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 16.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            children: [
              _buildCheckItem('الإقامة الفندقية'),
              _buildCheckItem('إفطار يومي'),
              _buildCheckItem('خدمات مرشد سياحي'),
              _buildCheckItem('جولات سياحية'),
              _buildCheckItem('النقل من وإلى المطار'),
              _buildCheckItem('تامين السفر'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWithoutAccommodationCard() {
    return Container(
      key: const ValueKey('without'),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'تتضمن الباقة بدون إقامة ما يلي:',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 16.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            children: [
              _buildCheckItem('جولات سياحية'),
              _buildCheckItem('خدمات مرشد سياحي'),
              _buildCheckItem('النقل من وإلى المطار'),
              _buildCheckItem('تامين السفر'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF374151),
              fontFamily: 'Madani Arabic',
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 6.w),
        Container(
          width: 22.w,
          height: 22.h,
          decoration: const BoxDecoration(
            color: Color(0xFFDCFCE7),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14.sp, color: const Color(0xFF16A34A)),
        ),
      ],
    );
  }

  Widget _buildIdealCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'مثالي للمسافرين',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Madani Arabic',
                ),
              ),
              SizedBox(width: 6.w),
              const Text('⭐', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'تشمل هذه الباقة كل ما تحتاجه لقضاء عطلة مريحة وخالية من المتاعب. أقم في فنادق من فئة 4-5 نجوم مع وجبة إفطار يومية واستمتع بجميع الجولات السياحية المصحوبة بمرشدين.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              height: 1.7,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'نظرة عامة على الباقات',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Madani Arabic',
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'استمتع برحلة رمضانية مميزة لمدة ثمانية أيام في ماليزيا، تجمع بين الثقافة والتراث وجمال الجزر. تبدأ الرحلة في كوالالمبور برحلة خاصة للراحة والاسترخاء. ثم تكتشف أبرز معالم المدينة والأسواق الرمضانية المسائية. اكتشف كهوف باتو ومعبد تيان هو قبل التوجه جواً إلى بينانج للتجول في شوارعها التاريخية والاستمتاع بتجارب إفطار مميزة على شاطئ البحر. تم تابع رحلتك إلى لانكاوي لركوب التلفريك، والاستمتاع بالمناظر الخلابة، وخوض مغامرات الجزيرة. مع قضاء فترة ما بعد الظهر والمساء في الاسترخاء، تختتم الرحلة برحلة خاصة إلى مطار لانكاوي الدولي، حاملاً معك ذكريات لا تُنسى من ماليزيا خلال شهر رمضان.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
              fontFamily: 'Madani Arabic',
              height: 1.8,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

// Backward-compatible function wrapper
Widget buildInclusionSection() => const BuildInclusionSection();
