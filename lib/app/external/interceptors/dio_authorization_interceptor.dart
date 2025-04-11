import 'package:dio/dio.dart';

import '../../domain/architecture/constants.dart';
import '../../domain/services/authorization_service.dart';
import '../architecture/data_failures.dart';

class DioAuthorizationInterceptor extends Interceptor
    implements AuthorizationService {
  DioAuthorizationInterceptor();

  String? bearer;

  bool validateStatus(int? status) {
    return true;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (bearer != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $bearer',
      });
    }

    options.validateStatus = validateStatus;
    options.baseUrl = Constants.baseUrl;
    options.contentType = 'application/graphql';

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      handler.reject(
        DioAuthorizationFailure(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }

    if (response.statusCode == 500) {
      handler.reject(
        DioServerFailure(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }

    handler.next(response);
  }

  @override
  void removeBearer() {
    bearer = null;
  }

  @override
  void setBearer(String token) {
    bearer = token;
  }
}
