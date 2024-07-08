import '../../core/constants/constants.dart';
import 'Model.dart';

/// Offer model
class OfferModel extends Model {
  /// title
 final String title;
 /// description
 final String description;
 /// image
 final String image;
 /// discount
 final double discount;
 /// constructor
  OfferModel({
    required this.title,
    required this.description,
    required this.image,
    required this.discount,
  });
  @override
  OfferModel copyWith(
      {String? title, String? description, String? image, double? discount}) {
    return OfferModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      discount: discount ?? this.discount,
    );
  }

  @override

  Json get toJson => {
    'title': title,
    'description': description,
    'image': image,
    'discount': discount
  };
  /// fromJson
  factory OfferModel.fromJson(Json json) {
    return OfferModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      discount: json['discount'],
    );
  }
}
