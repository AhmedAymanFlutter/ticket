import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:ticket/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ticket/features/home/data/datasources/home_remote_data_source.dart';
import 'package:ticket/features/home/data/repositories/home_repository_impl.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/home/presentation/manager/offers_cubit.dart';
import 'package:ticket/features/tours/data/datasources/tours_remote_data_source.dart';
import 'package:ticket/features/tours/data/repositories/tours_repository_impl.dart';
import 'package:ticket/features/tours/domain/repositories/tours_repository.dart';
import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';
import 'package:ticket/features/tours/presentation/manager/tour_details_cubit.dart';
import 'package:ticket/features/packages/data/datasources/packages_remote_data_source.dart';
import 'package:ticket/features/packages/data/repositories/packages_repository_impl.dart';
import 'package:ticket/features/packages/domain/repositories/packages_repository.dart';
import 'package:ticket/features/packages/presentation/manager/package_types_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_countries_cubit.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_cubit.dart';
import 'package:ticket/features/services/data/datasources/services_remote_data_source.dart';
import 'package:ticket/features/services/data/repositories/services_repository_impl.dart';
import 'package:ticket/features/services/domain/repositories/services_repository.dart';
import 'package:ticket/features/services/presentation/manager/services_cubit.dart';
import 'package:ticket/features/services/presentation/manager/contact_us_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Onboarding
  // Bloc
  sl.registerFactory(() => OnboardingCubit(sl()));

  // Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  //! Features - Home, Tours & Packages
  // Bloc
  sl.registerFactory(() => CitiesCubit(homeRepository: sl()));
  sl.registerFactory(() => OffersCubit(homeRepository: sl()));
  sl.registerFactory<ToursCubit>(() => ToursCubit(repository: sl()));
  sl.registerFactory<TourDetailsCubit>(() => TourDetailsCubit(sl()));
  sl.registerFactory<PackageTypesCubit>(
    () => PackageTypesCubit(repository: sl()),
  );
  sl.registerFactory<PackageCountriesCubit>(
    () => PackageCountriesCubit(repository: sl()),
  );
  sl.registerFactory<PackageDetailsCubit>(
    () => PackageDetailsCubit(repository: sl()),
  );
  sl.registerFactory<ServicesCubit>(() => ServicesCubit(repository: sl()));
  sl.registerFactory<ContactUsCubit>(() => ContactUsCubit(repository: sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ToursRepository>(
    () => ToursRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PackagesRepository>(
    () => PackagesRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ServicesRepository>(
    () => ServicesRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ToursRemoteDataSource>(
    () => ToursRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<PackagesRemoteDataSource>(
    () => PackagesRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ServicesRemoteDataSource>(
    () => ServicesRemoteDataSourceImpl(),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
