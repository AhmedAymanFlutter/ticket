import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:ticket/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:ticket/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ticket/features/home/data/datasources/home_remote_data_source.dart';
import 'package:ticket/features/home/data/repositories/home_repository_impl.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';
import 'package:ticket/features/home/presentation/manager/cities_cubit.dart';
import 'package:ticket/features/home/presentation/manager/branches_cubit.dart';
import 'package:ticket/features/home/presentation/manager/offers_cubit.dart';
import 'package:ticket/features/tours/data/datasources/tours_remote_data_source.dart';
import 'package:ticket/features/tours/data/repositories/tours_repository_impl.dart';
import 'package:ticket/features/tours/domain/repositories/tours_repository.dart';
import 'package:ticket/features/tours/presentation/manager/tours_cubit.dart';
import 'package:ticket/features/tours/presentation/manager/tour_details_cubit.dart';
import 'package:ticket/features/flights/domain/entities/presentation/manager/flight_search_cubit.dart';
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
import 'package:ticket/features/hotels/data/datasources/hotels_remote_data_source.dart';
import 'package:ticket/features/hotels/data/repositories/hotels_repository_impl.dart';
import 'package:ticket/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_cubit.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_cubit.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/features/travel_guide/data/datasources/travel_guide_remote_data_source.dart';
import 'package:ticket/features/travel_guide/data/repositories/travel_guide_repository.dart';
import 'package:ticket/features/travel_guide/presentation/manager/travel_guide_details_cubit.dart';
import 'package:ticket/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ticket/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';
import 'package:ticket/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/login_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/facebook_sign_in_usecase.dart';
import 'package:ticket/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<APIHelper>(() => APIHelper());
  //! Features - Onboarding
  // Bloc
  sl.registerFactory(() => OnboardingCubit(sl()));

  // Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  //! Features - Home, Tours & Packages
  // Bloc
  sl.registerFactory<CitiesCubit>(() => CitiesCubit(homeRepository: sl()));
  sl.registerFactory<BranchesCubit>(() => BranchesCubit(homeRepository: sl()));
  sl.registerFactory<OffersCubit>(() => OffersCubit(homeRepository: sl()));
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
  sl.registerFactory<FlightSearchCubit>(() => FlightSearchCubit());
  sl.registerFactory<ServicesCubit>(() => ServicesCubit(repository: sl()));
  sl.registerFactory<ContactUsCubit>(() => ContactUsCubit(repository: sl()));
  sl.registerFactory<TravelGuideDetailsCubit>(
    () => TravelGuideDetailsCubit(sl()),
  );
  sl.registerFactory<HotelsCubit>(() => HotelsCubit(repository: sl()));
  sl.registerFactory<HotelDetailsCubit>(
    () => HotelDetailsCubit(repository: sl()),
  );
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      signupUseCase: sl(),
      loginUseCase: sl(),
      getMeUseCase: sl(),
      sendOtpUseCase: sl(),
      resetPasswordUseCase: sl(),
      verifyOtpUseCase: sl(),
      googleSignInUseCase: sl(),
      facebookSignInUseCase: sl(),
    ),
  );

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
  sl.registerLazySingleton<TravelGuideRepository>(
    () => TravelGuideRepository(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<HotelsRepository>(
    () => HotelsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<TravelGuideRemoteDataSource>(
    () => TravelGuideRemoteDataSource(sl()),
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
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiHelper: sl()),
  );
  sl.registerLazySingleton<HotelsRemoteDataSource>(
    () => HotelsRemoteDataSourceImpl(apiHelper: sl()),
  );
  sl.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(repository: sl()),
  );
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton<GetMeUseCase>(() => GetMeUseCase(repository: sl()));
  sl.registerLazySingleton<SendOtpUseCase>(
    () => SendOtpUseCase(repository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(repository: sl()),
  );
  sl.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(repository: sl()),
  );
  sl.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(repository: sl()),
  );
  sl.registerLazySingleton<FacebookSignInUseCase>(
    () => FacebookSignInUseCase(repository: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
