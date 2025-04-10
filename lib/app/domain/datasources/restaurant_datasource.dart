import '../query_entity/get_restaurant_query_entity.dart';

abstract interface class RestaurantDatasource {
  Future<GetRestaurantQueryEntity> getRestaurants(GetRestaurantQueryEntity query);
}
