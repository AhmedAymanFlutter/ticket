import 'package:flutter_bloc/flutter_bloc.dart';
import 'flight_search_state.dart';

class FlightSearchCubit extends Cubit<FlightSearchState> {
  FlightSearchCubit() : super(const FlightSearchState());

  void toggleTripType(bool isRoundTrip) {
    emit(state.copyWith(isRoundTrip: isRoundTrip));
  }

  void updateFromCity(String city) {
    emit(state.copyWith(fromCity: city));
  }

  void updateToCity(String city) {
    emit(state.copyWith(toCity: city));
  }

  void swapStations() {
    emit(state.copyWith(fromCity: state.toCity, toCity: state.fromCity));
  }

  void updateDepartureDate(DateTime date) {
    emit(state.copyWith(departureDate: date));
  }

  void updateReturnDate(DateTime date) {
    emit(state.copyWith(returnDate: date));
  }

  void updatePassengerCount(int count) {
    if (count > 0) {
      emit(state.copyWith(passengerCount: count));
    }
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void submitRequest() {
    // Here we would normally call a use case
    print('--- Flight Search Request Submitted ---');
    print('Trip Type: ${state.isRoundTrip ? "Round Trip" : "One Way"}');
    print('From: ${state.fromCity}');
    print('To: ${state.toCity}');
    print('Departure: ${state.departureDate}');
    print('Return: ${state.returnDate}');
    print('Passengers: ${state.passengerCount}');
    print('Email: ${state.email}');
    print('Phone: ${state.phone}');
  }
}
