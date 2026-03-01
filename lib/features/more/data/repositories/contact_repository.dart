import '../../../../core/network/api_response.dart';
import '../datasources/contact_remote_data_source.dart';
import '../models/contact_request.dart';

class ContactRepository {
  final ContactRemoteDataSource _remoteDataSource;

  ContactRepository(this._remoteDataSource);

  Future<ApiResponse<dynamic>> sendContactMessage(
    ContactRequest request,
  ) async {
    return await _remoteDataSource.sendContactMessage(request);
  }
}
