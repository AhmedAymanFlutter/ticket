import 'package:equatable/equatable.dart';
import 'package:ticket/features/home/data/models/branch_home_model.dart';

abstract class BranchesState extends Equatable {
  const BranchesState();

  @override
  List<Object?> get props => [];
}

class BranchesInitial extends BranchesState {}

class BranchesLoading extends BranchesState {}

class BranchesSuccess extends BranchesState {
  final List<BranchHomeModel> branches;

  const BranchesSuccess({required this.branches});

  @override
  List<Object?> get props => [branches];
}

class BranchesFailure extends BranchesState {
  final String message;

  const BranchesFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
