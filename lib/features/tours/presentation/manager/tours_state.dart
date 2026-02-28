import 'package:ticket/features/tours/data/models/tour_model.dart';
import 'package:equatable/equatable.dart';

abstract class ToursState extends Equatable {
  const ToursState();

  @override
  List<Object> get props => [];
}

class ToursInitial extends ToursState {}

class ToursLoading extends ToursState {}

class ToursSuccess extends ToursState {
  final List<TourModel> tours;
  final bool hasReachedMax;
  final bool isFetchingMore;

  const ToursSuccess(
    this.tours, {
    this.hasReachedMax = false,
    this.isFetchingMore = false,
  });

  ToursSuccess copyWith({
    List<TourModel>? tours,
    bool? hasReachedMax,
    bool? isFetchingMore,
  }) {
    return ToursSuccess(
      tours ?? this.tours,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }

  @override
  List<Object> get props => [tours, hasReachedMax, isFetchingMore];
}

class ToursFailure extends ToursState {
  final String message;

  const ToursFailure(this.message);

  @override
  List<Object> get props => [message];
}
