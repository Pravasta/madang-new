class UriHelper {
  static createUrl({
    required String host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
        scheme: 'http',
        host: host,
        port: 8000,
        path: path,
        queryParameters: queryParameters?.map(
          (key, value) => MapEntry(key, value.toString()),
        ));
  }
}
