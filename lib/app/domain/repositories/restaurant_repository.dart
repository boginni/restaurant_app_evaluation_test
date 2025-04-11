import '../architecture/result.dart';
import '../entities/restaurant_query_result_entity.dart';
import '../query_entity/get_restaurant_query_entity.dart';

abstract interface class RestaurantRepository {
  Future<Result<RestaurantQueryResultEntity>> getRestaurants(
    GetRestaurantQueryEntity query,
  );
}
