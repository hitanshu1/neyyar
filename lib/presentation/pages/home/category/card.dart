import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/category.dart';


/// Category card
class CategoryCard extends StatelessWidget {
  /// Category data
  final Category? category;

  /// Shimmer flag
  final bool isShimmer;

  /// Constructor
  const CategoryCard({super.key, this.category, this.isShimmer = false})
      : assert(isShimmer || category != null, 'Category must be provided if not shimmer');

  @override
  Widget build(BuildContext context) {
    return isShimmer ? buildShimmer() : buildCategoryCard();
  }

  /// Builds a shimmer effect widget for the category card.
  ///
  /// Returns:
  /// A [Widget] representing the shimmer effect for the category card.
  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            border: Border.all(color: Colorz.gray)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20.sp,
              width: 20.sp,
              color: Colors.white,
            ),
            SizedBox(width: 8.sp),
            Container(
              height: 20.sp,
              width: 100.sp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a [Container] widget that displays a category card with an image and a name.
  ///
  /// The [Container] widget has a padding of 10 [sp] and a decoration with a border radius of 20 [sp]
  /// and a border color of [Colorz.gray]. The child of the [Container] widget is a [Row] widget
  /// that contains a [ViewAppImage] widget and a [Text] widget. The [ViewAppImage] widget displays
  /// an image with a height and width of 20 [sp] and the asset URL is determined by the [Assets.getCategoryIcon]
  /// function. The [Text] widget displays the name of the category.
  ///
  /// Parameters:
  /// - [context]: The [BuildContext] object.
  /// - [category]: The [Category] object that contains the name of the category.
  ///
  /// Returns:
  /// A [Widget] representing the category card.
  Widget buildCategoryCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10.sp,vertical: 5.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: Colorz.gray)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ViewAppImage(
            height: 20.sp,
            width: 20.sp,
            assetsUrl: Assets.getCategoryIcon(category!.name),
          ),
          SizedBox(width: 8.sp),
          Text(category!.name),
        ],
      ),
    );
  }
}
