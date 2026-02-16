import 'package:equatable/equatable.dart';
import 'package:ticket/features/onboarding/domain/entities/onboarding_page_entity.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final List<OnboardingPageEntity> pages;
  final int pageIndex;
  final bool isLastPage;

  const OnboardingLoaded({
    required this.pages,
    this.pageIndex = 0,
    this.isLastPage = false,
  });

  @override
  List<Object> get props => [pages, pageIndex, isLastPage];

  OnboardingLoaded copyWith({
    List<OnboardingPageEntity>? pages,
    int? pageIndex,
    bool? isLastPage,
  }) {
    return OnboardingLoaded(
      pages: pages ?? this.pages,
      pageIndex: pageIndex ?? this.pageIndex,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}

class OnboardingCompleted extends OnboardingState {}
