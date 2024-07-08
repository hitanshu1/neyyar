import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/offer.dart';


/// Offer card
class OfferCard extends StatelessWidget {
  /// Offer data
  final OfferModel? offer;

  /// Shimmer flag
  final bool isShimmer;

  /// Constructor
   const OfferCard({super.key, this.offer, this.isShimmer = false})
      : assert(isShimmer || offer != null, 'Course must be provided if not shimmer');

  @override
  Widget build(BuildContext context) {
    return isShimmer ? buildShimmer() : buildOfferCard();
  }

  /// Builds the shimmer effect widget for the offer card.
  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 180.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.7), // Fully blurred
              Colors.black.withOpacity(0.5), // Partially blurred
              Colors.black.withOpacity(0.1), // No blur
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  /// Builds the actual offer card with real data.
  Widget buildOfferCard() {
    return Card(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
        ),
      child: Stack(
        children: [
          _image(),
          Positioned.fill(
            child: _blurWidget(),
          ),
          Positioned.fill(
            child: _information(),
          ),
        ],
      ),
    );
  }

  /// Returns a [Widget] that displays the image using ViewAppImage widget with the specified radius and imageUrl.
  Widget _image() {
    return ViewAppImage(
      radius: SizeConfig.borderRadius,
      imageUrl: offer?.image,
    );
  }

  /// Returns a [Widget] that displays a blurred container with a linear gradient.
  ///
  /// The container has a border radius of 10.sp and a gradient that transitions from
  /// fully black with opacity 0.7 at the bottom left to partially black with opacity 0.5
  /// at the bottom right and no blur at all at the top right. The gradient stops are
  /// defined as [0.0, 0.5, 1.0].
  Widget _blurWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.sp),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.7), // Fully blurred
              Colors.black.withOpacity(0.5), // Partially blurred
              Colors.black.withOpacity(0.1), // No blur
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  /// Returns a widget containing information about the offer, including title, discount percentage, and styling.
  Widget _information() {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.spaceBetween),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: .4.sw,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(
                offer?.title,
                color: Colorz.gray,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizeConfig.verticalSpace(),
              Txt(
                '${offer?.discount.toInt()}% \nOFF',
                fontWeight: FontWeight.bold,
                color: Colorz.white,
                fontSize: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
