import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/api_response.dart';
import '../models/contact_request.dart';

class ContactRemoteDataSource {
  final APIHelper _apiHelper;

  ContactRemoteDataSource(this._apiHelper);

  Future<ApiResponse<dynamic>> sendContactMessage(
    ContactRequest request,
  ) async {
    return await _apiHelper.postRequest(
      endPoint: EndPoints.contact,
      data: request.toJson(),
      isFormData: false, // Per request body format, it's JSON
      isAuthorized: false, // Usually contact forms don't require login
    );
  }
}
