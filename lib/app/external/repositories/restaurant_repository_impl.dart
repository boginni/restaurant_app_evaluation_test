import '../../domain/architecture/result.dart';
import '../../domain/datasources/restaurant_datasource.dart';
import '../../domain/entities/restaurant_query_result_entity.dart';
import '../../domain/query_entity/get_restaurant_query_entity.dart';
import '../../domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  const RestaurantRepositoryImpl(this.datasource);

  final RestaurantDatasource datasource;

  @override
  Future<Result<RestaurantQueryResultEntity>> getRestaurants(
    GetRestaurantQueryEntity query,
  ) async {
    try {
      final result = await datasource.getRestaurants(query);
      return Result.success(result);
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }
}
