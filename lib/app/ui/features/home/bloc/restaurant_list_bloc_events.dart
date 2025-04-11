sealed class RestaurantListBlocEvent {
  const RestaurantListBlocEvent();
}

class GetRestaurantsEvent extends RestaurantListBlocEvent {
  const GetRestaurantsEvent(
    this.offset,
    this.favorites,
  );

  final int offset;
  final bool favorites;

  bool get mostReload => offset == 0;
}
