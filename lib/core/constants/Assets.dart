part of 'constants.dart';

/// Assets class use to get all asset files
class Assets {
  Assets._();

  /// app logo
  static String logoTransparent = 'assets/smallLogoTransparent.png';

  /// no image
  static String noPhoto = 'assets/no-photo.png';

  

  /// dashboard icon
  /// home icon
  static String home = 'assets/icons/home.png';

  /// bell icon
  static String bell = 'assets/icons/bell.png';

  /// live icon
  static String live = 'assets/icons/live.png';

  /// menu
  static String menu = 'assets/icons/menu.png';

  /// search icon
  static String search = 'assets/icons/search.png';

///
/// Returns the path to the icon image for the given category.
///@param {String} category - The category for which to get the icon.
/// @return {String} The path to the icon image.

  static String getCategoryIcon(String category) {
    if(category.toLowerCase().contains('exam')) {
      return 'assets/icons/categories/exam.png';
       }else if (category.toLowerCase().contains('psc')) {
        return 'assets/icons/categories/psc.png';
       }
    return 'assets/icons/categories/${category.toLowerCase().replaceAll(' ', '_')}.png';
  }
}
