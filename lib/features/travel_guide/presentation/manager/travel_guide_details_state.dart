import 'package:equatable/equatable.dart';
import '../../data/models/guide_details_model.dart';

abstract class TravelGuideDetailsState extends Equatable {
  const TravelGuideDetailsState();

  @override
  List<Object?> get props => [];
}

class TravelGuideDetailsInitial extends TravelGuideDetailsState {}

class TravelGuideDetailsLoading extends TravelGuideDetailsState {}

class TravelGuideDetailsSuccess extends TravelGuideDetailsState {
  final GuideDetailsModel guide;

  const TravelGuideDetailsSuccess({required this.guide});

  @override
  List<Object?> get props => [guide];
}

class TravelGuideDetailsFailure extends TravelGuideDetailsState {
  final String message;

  const TravelGuideDetailsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
