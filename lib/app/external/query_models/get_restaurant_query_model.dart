import '../../domain/query_entity/get_restaurant_details_query_entity.dart';

class GetRestaurantQueryModel {
  const GetRestaurantQueryModel({
    required this.id,
  });

  factory GetRestaurantQueryModel.fromEntity(
    GetRestaurantDetailsQueryEntity entity,
  ) {
    return GetRestaurantQueryModel(
      id: entity.id,
    );
  }

  final String id;

  String toQuery() {
    final query = {
      'id': '"$id"',
    };

    final queryString =
        query.entries.map((entry) => '${entry.key} : ${entry.value}').join(',');

    return '''
query getRestaurants {
  search($queryString) {
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
}
