import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/services/domain/repositories/services_repository.dart';
import 'package:ticket/features/services/presentation/manager/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository repository;

  ServicesCubit({required this.repository}) : super(ServicesInitial());

  Future<void> getServices(String lang) async {
    emit(ServicesLoading());

    final servicesResult = await repository.getServices(lang);
    final settingsResult = await repository.getServiceSettings(lang);

    servicesResult.fold(
      (failure) => emit(ServicesFailure(message: failure.message)),
      (services) {
        settingsResult.fold(
          (failure) => emit(ServicesFailure(message: failure.message)),
          (settings) =>
              emit(ServicesSuccess(services: services, settings: settings)),
        );
      },
    );
  }
}
