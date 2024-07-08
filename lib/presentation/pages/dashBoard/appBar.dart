import 'package:flutter/material.dart';

import '../../../Widgets/Widgets.dart';
import '../../../Widgets/circularImage.dart';
import '../../../core/constants/constants.dart';

/// dash board app bar
class DashBoardAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// constructor
  const DashBoardAppBar({super.key});

  @override
  _DashBoardAppBarState createState() => _DashBoardAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DashBoardAppBarState extends State<DashBoardAppBar> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _menuWidget(),
      title: _categoryDropDown(),
      actions: [
        _searchButton(),
        _userProfile(),
      ]
          .map((e) => Row(
                children: [
                  e,
                  SizeConfig.horizontalSpace(),
                ],
              ))
          .toList(),
    );
  }

  Widget _menuWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageWithCircle(
        assetPath: Assets.menu,
        isHeigLight: true,
      ),
    );
  }

  Widget _categoryDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Txt(
          AppStrings.selectCategory,
          color: Colors.black,
          fontSize: SizeConfig.mediumFont,
        ),
        value: selectedCategory,
        icon: const Icon(Icons.expand_more, color: Colors.black,),
        onChanged: (String? newValue) {
          setState(() {
            selectedCategory = newValue;
          });
        },
        items: <String>[
          'Competitive Exam',
          'Kerala PSC',
          'Banking',
          'IT & Software',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Txt(value,fontSize: SizeConfig.mediumFont,),
          );
        }).toList(),
      ),
    );
  }

  Widget _searchButton() {
    return Inkk(
      child: ImageWithCircle(
        assetPath: Assets.search,
      ),
      onTap: () {
        // Handle search action
      },
    );
  }

  Widget _userProfile() {
    return Inkk(
      onTap: () {
        Widgets.showToast('Not Implemented');

        /// navigate to profile page
      },
      child: const CircularImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH7JY6U-AhEPRSI2iyLwHVfE_O1_EHfS9fXpM5QS4PREzUicCR3wBBvxAsAHNDVOWL7SY&usqp=CAU',
      ),
    );
  }
}
