import 'package:equatable/equatable.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';

abstract class PackageDetailsState extends Equatable {
  const PackageDetailsState();

  @override
  List<Object?> get props => [];
}

class PackageDetailsInitial extends PackageDetailsState {}

class PackageDetailsLoading extends PackageDetailsState {}

class PackageDetailsSuccess extends PackageDetailsState {
  final PackageDetailsModel packageDetails;
  final int selectedBranchIndex;

  const PackageDetailsSuccess({
    required this.packageDetails,
    this.selectedBranchIndex = 0,
  });

  PackageBranchModel? get selectedBranch {
    if (packageDetails.branches.isEmpty) return null;
    if (selectedBranchIndex < 0 || selectedBranchIndex >= packageDetails.branches.length) {
      return packageDetails.branches.first;
    }
    return packageDetails.branches[selectedBranchIndex];
  }

  PackageDetailsSuccess copyWith({
    PackageDetailsModel? packageDetails,
    int? selectedBranchIndex,
  }) {
    return PackageDetailsSuccess(
      packageDetails: packageDetails ?? this.packageDetails,
      selectedBranchIndex: selectedBranchIndex ?? this.selectedBranchIndex,
    );
  }

  @override
  List<Object?> get props => [packageDetails, selectedBranchIndex];
}

class PackageDetailsFailure extends PackageDetailsState {
  final String message;

  const PackageDetailsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
