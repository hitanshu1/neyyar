
import 'package:flutter/material.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';

/// course tag
class CourseTag extends StatelessWidget {
  /// course tag
  final String tag;
  /// constructor
  const CourseTag({super.key,required this.tag});


  Color get _getColor {
    if (tag == 'Live') {
      return Colors.brown;
    } else if (tag == 'Offer') {
      return Colors.green;
    } else if (tag == 'Premium') {  
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: _getColor,
            borderRadius: BorderRadius.circular(SizeConfig.borderRadius*.5),
          ),
          child:tag == 'Live' ? Row(
            children: [
              const Icon(Icons.circle, size: 8.0, color: Colorz.white,),
              SizeConfig.horizontalSpace(),
              Txt(tag, color: Colorz.white,)
            ],
          ) : Txt(tag, color: Colorz.white,)
        );
  }
}
