import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:ticket/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Onboarding
  // Bloc
  sl.registerFactory(() => OnboardingCubit(sl()));

  // Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
