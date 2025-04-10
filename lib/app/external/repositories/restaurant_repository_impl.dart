import '../../domain/architecture/either.dart';
import '../../domain/architecture/response.dart';
import '../../domain/datasources/restaurant_datasource.dart';
import '../../domain/query_entity/get_restaurant_query_entity.dart';
import '../../domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  const RestaurantRepositoryImpl(this.datasource);

  final RestaurantDatasource datasource;

  @override
  Future<Response<GetRestaurantQueryEntity>> getRestaurants(
    GetRestaurantQueryEntity query,
  ) async {
    // try {
    //   final result = await datasource.getRestaurants(query);
    //
    //   return Either.right(result);
    // } catch (e) {
    //   return Either.left(e);
    // }

    throw UnimplementedError();
  }
}
