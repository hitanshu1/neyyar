import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'category/list.dart';
import 'course/list.dart';
import 'offer/slider.dart';

///home tab
class HomeTab extends StatelessWidget {
  /// constructor
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.pagePadding,
      child: ListView(
        children: [
          const OfferSlider(),
          const CategoryList(),
          const CourseList()
        ].map((e) {
          return Column(
            children: [
              e,
              SizeConfig.verticalSpaceMedium(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
