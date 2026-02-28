import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/tours/domain/repositories/tours_repository.dart';
import 'package:ticket/features/tours/presentation/manager/tours_state.dart';

class ToursCubit extends Cubit<ToursState> {
  final ToursRepository repository;

  int _currentPage = 1;
  final int _limit = 20;
  String? _currentSearch;
  String? _currentCity;
  int? _currentMinPrice;
  int? _currentMaxPrice;
  String? _currentLang;

  ToursCubit({required this.repository}) : super(ToursInitial());

  Future<void> getTours(
    String lang, {
    String? search,
    String? city,
    int? minPrice,
    int? maxPrice,
  }) async {
    _currentPage = 1;
    _currentSearch = search;
    _currentCity = city;
    _currentMinPrice = minPrice;
    _currentMaxPrice = maxPrice;
    _currentLang = lang;

    emit(ToursLoading());
    final result = await repository.getTours(
      lang,
      search: _currentSearch,
      city: _currentCity,
      minPrice: _currentMinPrice,
      maxPrice: _currentMaxPrice,
      page: _currentPage,
      limit: _limit,
    );

    if (result.isSuccess && result.data != null) {
      final tours = result.data!;
      emit(
        ToursSuccess(
          tours,
          hasReachedMax: tours.length < _limit,
          isFetchingMore: false,
        ),
      );
    } else {
      emit(ToursFailure(result.message ?? 'Failed to load tours'));
    }
  }

  Future<void> fetchMoreTours() async {
    if (state is ToursSuccess && _currentLang != null) {
      final currentState = state as ToursSuccess;
      if (currentState.hasReachedMax || currentState.isFetchingMore) return;

      emit(currentState.copyWith(isFetchingMore: true));
      _currentPage++;

      final result = await repository.getTours(
        _currentLang!,
        search: _currentSearch,
        city: _currentCity,
        minPrice: _currentMinPrice,
        maxPrice: _currentMaxPrice,
        page: _currentPage,
        limit: _limit,
      );

      if (result.isSuccess && result.data != null) {
        final newTours = result.data!;
        emit(
          ToursSuccess(
            [...currentState.tours, ...newTours],
            hasReachedMax: newTours.length < _limit,
            isFetchingMore: false,
          ),
        );
      } else {
        // If it fails to fetch more, revert to previous success state (stop fetching indicator)
        emit(currentState.copyWith(isFetchingMore: false));
      }
    }
  }
}
