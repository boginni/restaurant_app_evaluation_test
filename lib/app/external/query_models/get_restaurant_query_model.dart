import '../../domain/query_entity/get_restaurant_query_entity.dart';

class GetRestaurantQueryModel {
  const GetRestaurantQueryModel({
    required this.offset,
  });

  factory GetRestaurantQueryModel.fromEntity(
    GetRestaurantQueryEntity entity,
  ) {
    return GetRestaurantQueryModel(
      offset: entity.offset,
    );
  }

  final int offset;

  String toQuery() => '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
  ''';
}
