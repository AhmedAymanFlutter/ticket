import 'package:bloc/bloc.dart';
import 'package:ticket/features/tours/domain/repositories/tours_repository.dart';
import 'package:ticket/features/tours/presentation/manager/tour_details_state.dart';

class TourDetailsCubit extends Cubit<TourDetailsState> {
  final ToursRepository toursRepository;

  TourDetailsCubit(this.toursRepository) : super(TourDetailsInitial());

  Future<void> fetchTourDetails(String lang, String productCode) async {
    emit(TourDetailsLoading());
    final result = await toursRepository.getTourDetails(lang, productCode);

    if (result.isSuccess && result.data != null) {
      if (!isClosed) {
        emit(TourDetailsSuccess(tourDetails: result.data!));
      }
    } else {
      if (!isClosed) {
        emit(
          TourDetailsFailure(
            message:
                result.message ??
                'An error occurred while fetching tour details',
          ),
        );
      }
    }
  }
}
