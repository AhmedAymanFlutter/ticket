import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/travel_guide_repository.dart';
import 'travel_guide_details_state.dart';

class TravelGuideDetailsCubit extends Cubit<TravelGuideDetailsState> {
  final TravelGuideRepository _repository;

  TravelGuideDetailsCubit(this._repository)
    : super(TravelGuideDetailsInitial());

  Future<void> getGuideDetails(String slug) async {
    emit(TravelGuideDetailsLoading());
    final result = await _repository.getGuideDetails(slug);
    if (result.isSuccess) {
      if (result.data != null) {
        emit(TravelGuideDetailsSuccess(guide: result.data!));
      } else {
        emit(const TravelGuideDetailsFailure(message: 'No data found'));
      }
    } else {
      emit(
        TravelGuideDetailsFailure(
          message: result.message ?? 'Error fetching guide',
        ),
      );
    }
  }
}
