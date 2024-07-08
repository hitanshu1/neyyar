import '../../Extensions/Extensions.dart';
import '../../core/constants/constants.dart';
import 'Model.dart';

///Course model
class Course extends Model {
  /// title of the course
  final String title;
  /// description of the course
  final String description;
  /// progress of the course
  final double progress;
  /// premium
  final bool premium;
  /// live
  final bool live;
  /// average rating
  final double averageRating;
  /// total ratings
  final int totalRatings;
  /// image
  final String image;
  /// tags
  final List<String> tags;
///Constructor
  Course({
    required this.title,
    required this.description,
    required this.progress,
    required this.premium,
    required this.live,
    required this.averageRating,
    required this.totalRatings,
    required this.image,
    required this.tags,

  });

  @override
  Course copyWith(
      {String? title,
      String? description,
      double? progress,
      bool? premium,
      bool? live,
      double? averageRating,
      int? totalRatings,
      String? image,
      List<String>? tags,

      }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      progress: progress ?? this.progress,
      premium: premium ?? this.premium,
      live: live ?? this.live,
      averageRating: averageRating ?? this.averageRating, 
      totalRatings: totalRatings ?? this.totalRatings,
      image: image ?? this.image,
      tags: tags ?? this.tags,
    );
  }

  @override
  Json get toJson =>{
    'title': title,
    'description': description,
    'progress': progress,
    'premium': premium,
    'live': live,
    'averageRating': averageRating,
    'totalRatings': totalRatings,
    'image': image,
    'tags': tags
  };
/// fromJson
  factory Course.fromJson(Json json) {
    return Course(
      title: json.safeString('title'),
      description: json.safeString('description'),
      progress: json.safeDouble('progress'),
      premium: json.safeBool('premium'),
      live: json.safeBool('live'),
      averageRating: json.safeDouble('averageRating'),
      totalRatings: json.safeInt('totalRatings'),
      image: json.safeString('image'),
      tags: json.safeListOfStrings('tags'),
      
    );
  }
}
