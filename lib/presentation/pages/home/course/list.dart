
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../Widgets/title.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/course/bloc.dart';
import 'card.dart';

/// course list
class CourseList extends StatelessWidget {
  /// constructor
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         AppTitleWidet(title: 'My Courses', onTap: () {}),
         SizeConfig.verticalSpace(),
          BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseLoading) {
                return SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(2, (int index) {
                      return Padding(
                       padding: SizeConfig.horizontalTilePadding.copyWith(right: 15.sp),
                        child: const CourseCard(isShimmer: true,),
                      );
                    }),
                  ),
                );
              } else if (state is CourseLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.courses
                        .map((course) => Padding(
                              padding: SizeConfig.horizontalTilePadding
                                  .copyWith(right: 15.sp),
                              child: CourseCard(course: course),
                            ))
                        .toList(),
                  ),
                );
              } else if (state is CourseError) {
                return Widgets.noDataAvailable();
              }
              return Container();
            },
          ),
      ],
    );
  }
}
