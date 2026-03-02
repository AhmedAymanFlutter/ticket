import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';
import 'package:ticket/features/home/presentation/manager/branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  final HomeRepository homeRepository;

  BranchesCubit({required this.homeRepository}) : super(BranchesInitial());

  Future<void> getBranches(String lang) async {
    emit(BranchesLoading());
    final result = await homeRepository.getBranches(lang);
    if (result.isSuccess) {
      emit(BranchesSuccess(branches: result.data ?? []));
    } else {
      emit(
        BranchesFailure(message: result.message ?? 'Failed to fetch branches'),
      );
    }
  }
}
