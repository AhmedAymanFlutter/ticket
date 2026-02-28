import 'package:equatable/equatable.dart';
import 'package:ticket/features/tours/data/models/tour_details_model.dart';

abstract class TourDetailsState extends Equatable {
  const TourDetailsState();

  @override
  List<Object> get props => [];
}

class TourDetailsInitial extends TourDetailsState {}

class TourDetailsLoading extends TourDetailsState {}

class TourDetailsSuccess extends TourDetailsState {
  final TourDetailsModel tourDetails;

  const TourDetailsSuccess({required this.tourDetails});

  @override
  List<Object> get props => [tourDetails];
}

class TourDetailsFailure extends TourDetailsState {
  final String message;

  const TourDetailsFailure({required this.message});

  @override
  List<Object> get props => [message];
}
