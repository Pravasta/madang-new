import 'package:http/http.dart' as http;
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_local_datasources.dart';
import 'package:madang_app/data/model/response/package_response_model.dart';

import '../../../core/exception/exception.dart';

abstract class PackageRemoteDatasources {
  Future<PackageResponseModel> getAllPackage();
}

class PackageRemoteDatasourcesImpl implements PackageRemoteDatasources {
  final http.Client _client;
  final AppEndpoint _appEndpoint;

  PackageRemoteDatasourcesImpl({
    required http.Client client,
    required AppEndpoint appEndpoint,
  })  : _client = client,
        _appEndpoint = appEndpoint;

  @override
  Future<PackageResponseModel> getAllPackage() async {
    final data = await AuthLocalDatasourceImpl().getAuthData();
    final url = _appEndpoint.getAllPackage();

    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${data.token}'
    };

    final response = await _client.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      return PackageResponseModel.fromJson(response.body);
    } else {
      final message = PackageResponseModel.fromJson(response.body);
      throw ApiErrorHandler.handleError(
        statusCode: response.statusCode,
        error: ApiException(message: message.message).toString(),
      );
    }
  }

  factory PackageRemoteDatasourcesImpl.create() {
    return PackageRemoteDatasourcesImpl(
      client: http.Client(),
      appEndpoint: AppEndpoint.create(),
    );
  }
}
