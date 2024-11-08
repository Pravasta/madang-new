import 'package:http/http.dart' as http;

import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/data/model/request/login_request_model.dart';
import 'package:madang_app/data/model/request/register_request_model.dart';
import 'package:madang_app/data/model/response/login_response_model.dart';
import 'package:madang_app/data/model/response/register_response_model.dart';

import '../../../core/exception/exception.dart';

abstract class AuthRemotDatasources {
  Future<LoginResponseModel> login(LoginRequestModel data);
  Future<RegisterResponseModel> register(RegisterRequestModel data);
}

class AuthRemoteDatasourcesImpl implements AuthRemotDatasources {
  final http.Client _client;
  final AppEndpoint _appEndpoint;

  AuthRemoteDatasourcesImpl(
      {required http.Client client, required AppEndpoint appEndpoint})
      : _client = client,
        _appEndpoint = appEndpoint;

  @override
  Future<LoginResponseModel> login(LoginRequestModel data) async {
    final url = _appEndpoint.login();

    final header = {
      'Content-Type': 'application/json',
    };

    final response = await _client.post(
      url,
      body: data.toJson(),
      headers: header,
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      final message = RegisterResponseModel.fromJson(response.body);
      throw ApiErrorHandler.handleError(
        statusCode: response.statusCode,
        error: ApiException(message: message.message).toString(),
      );
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel data) async {
    final url = _appEndpoint.register();

    final header = {
      'Content-Type': 'application/json',
    };

    final response = await _client.post(
      url,
      body: data.toJson(),
      headers: header,
    );

    if (response.statusCode == 201) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      final message = RegisterResponseModel.fromJson(response.body);
      throw ApiErrorHandler.handleError(
        statusCode: response.statusCode,
        error: ApiException(message: message.message).toString(),
      );
    }
  }

  factory AuthRemoteDatasourcesImpl.create() {
    return AuthRemoteDatasourcesImpl(
      client: http.Client(),
      appEndpoint: AppEndpoint.create(),
    );
  }
}
