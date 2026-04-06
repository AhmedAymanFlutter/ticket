import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:ticket/features/hotels/presentation/manager/hotel_details_state.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsState> {
  final HotelsRepository repository;

  HotelDetailsCubit({required this.repository}) : super(HotelDetailsInitial());

  Future<void> getHotelDetails(dynamic id) async {
    emit(HotelDetailsLoading());
    final result = await repository.getHotelDetails(id);
    result.fold(
      (failure) => emit(HotelDetailsFailure(message: failure.message)),
      (hotelDetails) => emit(HotelDetailsSuccess(hotelDetails: hotelDetails)),
    );
  }
}
