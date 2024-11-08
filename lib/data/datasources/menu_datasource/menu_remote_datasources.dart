import 'package:http/http.dart' as http;
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/data/model/response/menu_response_model.dart';

import '../../../core/exception/exception.dart';
import '../auth_datasource/auth_local_datasources.dart';

abstract class MenuRemoteDatasources {
  Future<MenuResponseModel> getAllMenu();
}

class MenuRemoteDatasourcesImpl implements MenuRemoteDatasources {
  final AppEndpoint _appEndpoint;
  final http.Client _client;

  MenuRemoteDatasourcesImpl(
      {required AppEndpoint appEndpoint, required http.Client client})
      : _appEndpoint = appEndpoint,
        _client = client;

  @override
  Future<MenuResponseModel> getAllMenu() async {
    final data = await AuthLocalDatasourceImpl().getAuthData();
    final url = _appEndpoint.getAllMenu();

    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${data.token}'
    };

    final response = await _client.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      return MenuResponseModel.fromJson(response.body);
    } else {
      final message = MenuResponseModel.fromJson(response.body);
      throw ApiErrorHandler.handleError(
        statusCode: response.statusCode,
        error: ApiException(message: message.message).toString(),
      );
    }
  }

  factory MenuRemoteDatasourcesImpl.create() {
    return MenuRemoteDatasourcesImpl(
      appEndpoint: AppEndpoint.create(),
      client: http.Client(),
    );
  }
}
