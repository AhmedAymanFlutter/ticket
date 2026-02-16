import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository repository;

  OnboardingCubit(this.repository) : super(OnboardingInitial());

  Future<void> loadPages() async {
    emit(OnboardingLoading());
    try {
      final pages = await repository.getOnboardingPages();
      emit(OnboardingLoaded(pages: pages));
    } catch (e) {
      // Handle error state if needed
      emit(OnboardingInitial());
    }
  }

  void pageChanged(int index) {
    if (state is OnboardingLoaded) {
      final currentState = state as OnboardingLoaded;
      final isLast = index == currentState.pages.length - 1;
      emit(currentState.copyWith(pageIndex: index, isLastPage: isLast));
    }
  }

  Future<void> completeOnboarding() async {
    await repository.cacheOnboardingCompleted();
    emit(OnboardingCompleted());
  }
}
