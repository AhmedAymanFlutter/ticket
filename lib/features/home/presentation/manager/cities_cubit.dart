import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';
import 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final HomeRepository homeRepository;

  CitiesCubit({required this.homeRepository}) : super(CitiesInitial());

  Future<void> getCities(String lang) async {
    emit(CitiesLoading());

    final response = await homeRepository.getCities(lang);

    if (response.isSuccess) {
      emit(CitiesSuccess(cities: response.data ?? []));
    } else {
      emit(
        CitiesFailure(message: response.message ?? 'Unknown error occurred'),
      );
    }
  }
}
