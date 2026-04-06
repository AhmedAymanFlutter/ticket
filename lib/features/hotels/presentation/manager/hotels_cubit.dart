import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:ticket/features/hotels/presentation/manager/hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final HotelsRepository repository;

  HotelsCubit({required this.repository}) : super(HotelsInitial());

  Future<void> getHotels() async {
    emit(HotelsLoading());
    final result = await repository.getHotels();
    result.fold(
      (failure) => emit(HotelsFailure(message: failure.message)),
      (hotels) => emit(HotelsSuccess(hotels: hotels)),
    );
  }
}
