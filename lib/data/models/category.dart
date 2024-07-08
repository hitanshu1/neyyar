import '../../Extensions/Extensions.dart';
import '../../core/constants/constants.dart';
import 'Model.dart';

///category model
class Category extends Model {
  /// name of the category
  final String name;
  /// constructor
  Category({required this.name});

  @override
  Category copyWith({String? name}) {
    return Category(name: name ?? this.name);
  }

  @override
  
  Json get toJson => <String, dynamic>{
        'name': name,
      };
/// from json
  factory Category.fromJson(Json json) {
    return Category(name: json.safeString('name'));
  }
}
