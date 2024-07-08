import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/constants.dart';
import 'Widgets.dart';

/// app title widget
class AppTitleWidet extends StatelessWidget {
  /// title
  final String title;

  /// on tap
  final VoidCallback? onTap;

  /// constructor
  const AppTitleWidet({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3.sp,
          height: 25.sp,
          color: Colorz.brown,

        ),
        SizeConfig.horizontalSpace(),
        Expanded(child: Txt.title(title)),
        Inkk(onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colorz.gray,

            )
          ),
          child:  Icon(Icons.arrow_forward,size: 20.sp,))),
      ],
    );
  }
}
