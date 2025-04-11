import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'domain/datasources/restaurant_datasource.dart';
import 'domain/repositories/restaurant_repository.dart';
import 'domain/services/authorization_service.dart';
import 'domain/use_cases/get_restaurant_details_use_case.dart';
import 'domain/use_cases/get_restaurants_use_case.dart';
import 'external/datasources/restaurant_datasource_impl.dart';
import 'external/interceptors/dio_authorization_interceptor.dart';
import 'external/repositories/restaurant_repository_impl.dart';
import 'external/use_cases/get_restaurant_use_case_impl.dart';
import 'external/use_cases/get_restaurants_use_case_impl.dart';

GetIt setup() {
  final i = GetIt.asNewInstance();

  final dio = Dio();

  final interceptor = DioAuthorizationInterceptor();

  dio.interceptors.add(interceptor);

  i.registerSingleton(dio);

  i.registerSingleton<AuthorizationService>(
    interceptor,
  );

  i.registerFactory<RestaurantDatasource>(() => RestaurantDatasourceImpl(dio));

  i.registerFactory<RestaurantRepository>(
    () => RestaurantRepositoryImpl(i.get()),
  );

  i.registerFactory<GetRestaurantsUseCase>(
    () => GetRestaurantsUseCaseImpl(i.get()),
  );

  i.registerFactory<GetRestaurantDetailsUseCase>(
    () => GetRestaurantDetailsUseCaseImpl(i.get()),
  );

  return i;
}
