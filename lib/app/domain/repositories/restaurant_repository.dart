import '../architecture/response.dart';
import '../query_entity/get_restaurant_query_entity.dart';

abstract interface class RestaurantRepository {
  Future<Response<GetRestaurantQueryEntity>> getRestaurants(GetRestaurantQueryEntity query);
}
