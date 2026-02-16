import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/onboarding/domain/entities/onboarding_page_entity.dart';
import 'package:ticket/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences sharedPreferences;

  OnboardingRepositoryImpl(this.sharedPreferences);

  static const String _onboardingCompletedKey = 'onboarding_completed';

  @override
  Future<List<OnboardingPageEntity>> getOnboardingPages() async {
    // Return data directly, simulating fetch
    return [
      OnboardingPageEntity(
        title: 'onboarding.title3'.tr(),
        description: 'onboarding.desc3'.tr(),
        imagePath: 'assets/photo/image (1).png',
      ),
      OnboardingPageEntity(
        title: 'onboarding.title2'.tr(),
        description: 'onboarding.desc2'.tr(),
        imagePath: 'assets/photo/onboarding1.png',
      ),
      OnboardingPageEntity(
        title: 'onboarding.title1'.tr(),
        description: 'onboarding.desc1'.tr(),
        imagePath: 'assets/photo/onboarding.jpeg',
      ),
    ];
  }

  @override
  Future<void> cacheOnboardingCompleted() async {
    await sharedPreferences.setBool(_onboardingCompletedKey, true);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
  }
}
