import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/packages/domain/repositories/packages_repository.dart';
import 'package:ticket/features/packages/presentation/manager/package_details_state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsState> {
  final PackagesRepository repository;

  PackageDetailsCubit({required this.repository})
    : super(PackageDetailsInitial());

  Future<void> getPackageDetails(
    String packageTypeSlug,
    String packageSlug,
    String lang,
  ) async {
    emit(PackageDetailsLoading());
    final result = await repository.getPackageDetails(
      packageTypeSlug,
      packageSlug,
      lang,
    );
    result.fold(
      (failure) => emit(
        const PackageDetailsFailure(message: 'Failed to fetch package details'),
      ),
      (details) => emit(PackageDetailsSuccess(packageDetails: details)),
    );
  }

  void selectBranch(int index) {
    if (state is PackageDetailsSuccess) {
      final successState = state as PackageDetailsSuccess;
      if (index >= 0 && index < successState.packageDetails.branches.length) {
        emit(successState.copyWith(selectedBranchIndex: index));
      }
    }
  }
}
