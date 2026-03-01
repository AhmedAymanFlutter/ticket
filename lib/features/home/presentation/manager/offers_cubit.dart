import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';
import 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  final HomeRepository homeRepository;

  OffersCubit({required this.homeRepository}) : super(OffersInitial());

  // Mapping from our frontend filter keys to backend API format.
  // "activity" maps to "activity", "hotel" to "hotel", etc.
  String? _mapFilterToType(String filterKey) {
    switch (filterKey) {
      case 'common.flight':
        return 'flight';
      case 'common.hotel':
        return 'hotel';
      case 'common.package':
        return 'package';
      case 'common.activity':
        return 'activity';
      case 'common.all':
      default:
        return null; // Null means don't send type[], fetch all
    }
  }

  Future<void> getOffers(
    String lang, {
    String filterCategory = 'common.all',
  }) async {
    emit(OffersLoading(activeFilter: filterCategory));

    final filterType = _mapFilterToType(filterCategory);
    List<String>? typesList = filterType != null ? [filterType] : null;

    final response = await homeRepository.getOffers(lang, types: typesList);

    if (response.isSuccess) {
      if (!isClosed) {
        emit(
          OffersSuccess(
            offers: response.data ?? [],
            activeFilter: filterCategory,
          ),
        );
      }
    } else {
      if (!isClosed) {
        emit(
          OffersFailure(
            message: response.message ?? 'Unknown error occurred',
            activeFilter: filterCategory,
          ),
        );
      }
    }
  }
}
