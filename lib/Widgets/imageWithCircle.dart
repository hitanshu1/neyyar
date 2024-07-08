part of 'Widgets.dart';

/// image with circle
class ImageWithCircle extends StatelessWidget {
  /// asset path or url
  final String? assetPath, url;

/// highlight image
 final bool isHeigLight;

  /// constructor
  const ImageWithCircle({super.key, this.assetPath, this.url, this.isHeigLight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isHeigLight?Colorz.brown:Colors.transparent,
          border: Border.all(color:isHeigLight? Colorz.offWhite:Colorz.gray, 
          width: isHeigLight?2:1),
        ),
        child: ViewAppImage.icon(assetUrl: assetPath, url: url,
        color: isHeigLight?Colorz.white:Colorz.black,));
  }
}
