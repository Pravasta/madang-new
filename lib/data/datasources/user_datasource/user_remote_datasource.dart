import 'package:http/http.dart' as http;
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_local_datasources.dart';
import 'package:madang_app/data/model/response/user_response_model.dart';

import '../../../core/exception/exception.dart';

abstract class UserRemoteDatasource {
  Future<UserResponseModel> getUser();
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final AppEndpoint _appEndpoint;
  final http.Client _client;

  UserRemoteDatasourceImpl(
      {required AppEndpoint appEndpoint, required http.Client client})
      : _appEndpoint = appEndpoint,
        _client = client;

  @override
  Future<UserResponseModel> getUser() async {
    final data = await AuthLocalDatasourceImpl().getAuthData();
    final url = _appEndpoint.getUserById(data.user!.id.toString());

    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${data.token}'
    };

    final response = await _client.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      return UserResponseModel.fromJson(response.body);
    } else {
      final message = UserResponseModel.fromJson(response.body);
      throw ApiErrorHandler.handleError(
        statusCode: response.statusCode,
        error: ApiException(message: message.status).toString(),
      );
    }
  }

  factory UserRemoteDatasourceImpl.create() {
    return UserRemoteDatasourceImpl(
      appEndpoint: AppEndpoint.create(),
      client: http.Client(),
    );
  }
}
