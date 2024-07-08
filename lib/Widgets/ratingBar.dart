
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/constants.dart';
import 'Widgets.dart';

/// rating bar
class RatingBarr extends StatelessWidget {
  /// rating
  final double ?rating;
  /// rating count
  final int ?ratingCount;
  /// constructor
  const RatingBarr({super.key, this.rating,this.ratingCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Txt(rating,color:  Colorz.blue,),
        RatingBar.builder(
                initialRating: rating ?? 0,
                minRating: 1,
                itemSize: 15.sp,
                unratedColor: Colors.white,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
        SizeConfig.horizontalSpace(),
        Txt(ratingCount,color:  Colorz.blue,),
      ],
    );
  }
}
