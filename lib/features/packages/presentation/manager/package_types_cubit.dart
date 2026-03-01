import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/packages/domain/repositories/packages_repository.dart';
import 'package:ticket/features/packages/presentation/manager/package_types_state.dart';

class PackageTypesCubit extends Cubit<PackageTypesState> {
  final PackagesRepository repository;

  PackageTypesCubit({required this.repository}) : super(PackageTypesInitial());

  Future<void> getPackageTypes(String lang) async {
    emit(PackageTypesLoading());
    final result = await repository.getPackageTypes(lang);
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            const PackageTypesFailure(message: 'Failed to fetch package types'),
          );
        }
      },
      (packageTypes) {
        if (!isClosed) {
          emit(PackageTypesSuccess(packageTypes: packageTypes));
        }
      },
    );
  }
}
