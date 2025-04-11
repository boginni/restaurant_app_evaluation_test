import 'package:dio/dio.dart';

import '../../domain/architecture/constants.dart';

class DioAuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers.addAll({
      'Authorization': 'Bearer ${Constants.apiKey}',
    });

    options.contentType = 'application/graphql';
    handler.next(options);
  }
}
