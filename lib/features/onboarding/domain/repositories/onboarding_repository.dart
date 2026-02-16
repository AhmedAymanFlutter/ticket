import 'package:ticket/features/onboarding/domain/entities/onboarding_page_entity.dart';

abstract class OnboardingRepository {
  Future<List<OnboardingPageEntity>> getOnboardingPages();
  Future<void> cacheOnboardingCompleted();
  Future<bool> isOnboardingCompleted();
}
