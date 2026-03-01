import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/services/domain/repositories/services_repository.dart';
import 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ServicesRepository repository;

  ContactUsCubit({required this.repository}) : super(ContactUsInitial());

  Future<void> getSettings(String lang) async {
    emit(ContactUsLoading());
    final result = await repository.getAppSettings(lang);
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ContactUsFailure(failure.message));
        }
      },
      (settings) {
        if (!isClosed) {
          emit(ContactUsSuccess(settings));
        }
      },
    );
  }
}
