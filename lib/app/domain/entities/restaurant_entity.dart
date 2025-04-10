import 'category_entity.dart';
import 'hours_entity.dart';
import 'location_entity.dart';
import 'review_entity.dart';

class RestaurantEntity {
  const RestaurantEntity({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.photos,
    this.categories,
    this.hours,
    this.reviews,
    this.location,
  });

  final String? id;
  final String? name;
  final String? price;
  final double? rating;
  final List<String>? photos;
  final List<CategoryEntity>? categories;
  final List<HoursEntity>? hours;
  final List<ReviewEntity>? reviews;
  final LocationEntity? location;

  /// Use the first category for the category shown to the user
  String get displayCategory {
    if (categories != null && categories!.isNotEmpty) {
      return categories!.first.title ?? '';
    }
    return '';
  }

  /// Use the first image as the image shown to the user
  String get heroImage {
    if (photos != null && photos!.isNotEmpty) {
      return photos!.first;
    }
    return '';
  }

  /// This logic is probably not correct in all cases but it is ok
  /// for this application
  bool get isOpen {
    if (hours != null && hours!.isNotEmpty) {
      return hours!.first.isOpenNow ?? false;
    }
    return false;
  }
}
