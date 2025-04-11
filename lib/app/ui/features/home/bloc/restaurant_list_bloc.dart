import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/query_entity/get_restaurant_query_entity.dart';
import '../../../../domain/use_cases/get_restaurants_use_case.dart';
import '../../../utils/extensions/int_extension.dart';
import 'restaurant_list_bloc_events.dart';
import 'restaurant_list_bloc_states.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListBlocEvent, RestaurantListBlocState> {
  RestaurantListBloc(this.getRestaurantsUseCase)
      : super(const LoadingRestaurantListState()) {
    on<GetRestaurantsEvent>(
      loadFavoritesRestaurants,
    );
  }

  final GetRestaurantsUseCase getRestaurantsUseCase;

  Future<void> loadFavoritesRestaurants(
    GetRestaurantsEvent event,
    Emitter emitter,
  ) async {
    late final RestaurantListBlocState loadingState;

    if (event.mostReload || state is! LoadedRestaurantListState) {
      loadingState = const LoadingRestaurantListState();
    } else {
      final currentState = state as LoadedRestaurantListState;

      loadingState = currentState.copyWith(
        isLoadingMore: true,
      );
    }

    emitter(loadingState);

    await Future.delayed(
      1.second,
    );

    final result = await getRestaurantsUseCase(
      GetRestaurantQueryEntity(event.offset, event.favorites),
    );

    if (result.isSuccess) {
      emitter(
        LoadedRestaurantListState(
          result.success,
          false,
        ),
      );

      return;
    }

    emitter(
      const ErrorRestaurantListState(),
    );

    throw result.failure;
  }
}
