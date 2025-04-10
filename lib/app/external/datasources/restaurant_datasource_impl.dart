import 'package:dio/dio.dart';

import '../../domain/architecture/failure.dart';
import '../../domain/datasources/restaurant_datasource.dart';
import '../../domain/entities/restaurant_query_result_entity.dart';
import '../../domain/query_entity/get_restaurant_query_entity.dart';
import '../models/restaurant_query_result_model.dart';
import '../query_models/get_restaurant_query_model.dart';

class RestaurantDatasourceImpl implements RestaurantDatasource {
  const RestaurantDatasourceImpl(this.dio);

  final Dio dio;

  @override
  Future<RestaurantQueryResultEntity> getRestaurants(
    GetRestaurantQueryEntity query,
  ) async {
    final model = GetRestaurantQueryModel.fromEntity(query);

    final response = await dio.post(
      '/graphql',
      data: model.toQuery(),
    );

    if (response.statusCode == 200) {
      try {
        return RestaurantQueryResultModel.fromJson(
          response.data['data']['search'],
        ).toEntity();
      } on Exception catch (e, s) {
        throw SerializationFailure(e, s);
      }
    }

    throw UnknownFailure();
  }
}
