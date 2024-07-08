import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../Widgets/ratingBar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/course.dart';
import 'tag.dart';

/// course card
class CourseCard extends StatelessWidget {
  /// course data
  final Course? course;

  /// shimmer flag
  final bool isShimmer;

  /// constructor
  const CourseCard({super.key, this.course, this.isShimmer = false})
      : assert(isShimmer || course != null,
            'Course must be provided if not shimmer');

  @override
  Widget build(BuildContext context) {
    return isShimmer ? buildShimmer() : buildCourseCard();
  }

  /// Builds the shimmer effect widget for the course card.
  ///
  /// Returns:
  /// A [Widget] representing the shimmer effect for the course card.
  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: .7.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shimmerContainer(height: 150.sp, width: .7.sw),
            SizeConfig.verticalSpace(),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.spaceBetween),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerContainer(height: 10.sp, width: .6.sw),
                  SizeConfig.verticalSpaceSmall(),
                  _shimmerContainer(height: 10.sp, width: .5.sw),
                  SizeConfig.verticalSpaceSmall(),
                  _shimmerContainer(height: 10.sp, width: .4.sw),
                  SizeConfig.verticalSpaceSmall(),
                  _shimmerContainer(height: 10.sp, width: .3.sw),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build shimmer containers
  Widget _shimmerContainer({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
    );
  }

  /// Builds the course card with actual data.
  ///
  /// Returns:
  /// A [Widget] representing the course card.
  Widget buildCourseCard() {
    return Cardd(
      width: .7.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _courseImage(),
          SizeConfig.verticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.spaceBetween),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _courseProgress(),
                SizeConfig.verticalSpaceSmall(),
                _courseTags(),
                SizeConfig.verticalSpaceSmall(),
                _titleAndDescription(),
                _ratingWidget(),
                SizeConfig.verticalSpaceSmall(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns a [Widget] that displays the course image.
  ///
  /// The [ViewAppImage] widget is used to display the course image. It has a
  /// border radius of [SizeConfig.borderRadius], a height of 150 scaled pixels
  /// (sp), and a width of 100 scaled screen width (sw). The image URL is
  /// obtained from the [course] object's [image] property.
  Widget _courseImage() {
    return ViewAppImage(
      radius: SizeConfig.borderRadius,
      height: 150.sp,
      width: .7.sw,
      imageUrl: course!.image,
    );
  }

  /// Returns a widget that displays the progress of a course.
  ///
  /// The widget consists of a [Row] widget that contains two children:
  /// - An [Expanded] widget that contains a [LinearProgressIndicator] widget.
  ///   The [LinearProgressIndicator] displays the progress of the course using
  ///   the value of the `course.progress` property. The background color of the
  ///   progress indicator is set to `Colors.grey[300]`, and the color of the
  ///   progress is set to `Colorz.blue`.
  /// - A [SizeConfig.horizontalSpace] widget that adds horizontal space between
  ///   the progress indicator and the percentage text.
  /// - A [Txt] widget that displays the progress percentage of the course.
  ///   The percentage is calculated by multiplying the `course.progress` value
  ///   by 100 and rounding it to 0 decimal places.
  ///
  /// Returns:
  /// A [Widget] representing the course progress.
  Widget _courseProgress() {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: course!.progress/100,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colorz.blueAccent),
          ),
        ),
        SizeConfig.horizontalSpace(),
        Txt('${course!.progress.toInt()}%'),
      ],
    );
  }

  Widget _courseTags() {
    return Row(
      children: course!.tags.map((tag) {
        return Padding(
          padding: SizeConfig.horizontalTilePadding,
          child: CourseTag(tag: tag),
        );
      }).toList(),
    );
  }

  Widget _titleAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          course!.title,
          fontWeight: FontWeight.bold,
        ),
        Txt(course!.description),
      ],
    );
  }

  Widget _ratingWidget() {
    return RatingBarr(
      rating: course!.averageRating,
      ratingCount: course!.totalRatings,
    );
    
  }
}
