import '../../core.dart';

class AppEndpoint {
  final String _baseUrl;

  AppEndpoint({required String baseUrl}) : _baseUrl = baseUrl;

  Uri login() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/api/user/login',
    );
  }

  Uri register() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/api/user/register',
    );
  }

  Uri getUserById(String id) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/api/user/get-user-by-id/$id',
    );
  }

  Uri getAllPackage() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/api/package',
    );
  }

  Uri getAllMenu() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/api/menus',
    );
  }

  factory AppEndpoint.create() {
    return AppEndpoint(baseUrl: Variable.baseUrl);
  }
}
