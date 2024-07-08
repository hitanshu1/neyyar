import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../Widgets/title.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/category/bloc.dart';
import 'card.dart';

/// category list
class CategoryList extends StatelessWidget {
  /// constructor
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitleWidet(title: 'Categories', onTap: () {}),
        SizeConfig.verticalSpace(),
        BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state is CategoryLoading) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Row(
                    children: List.generate(2, (int index) {
                      return Padding(
                        padding: SizeConfig.horizontalTilePadding,
                        child: const CategoryCard(
                          isShimmer: true,
                        ),
                      );
                    }),
                  ),
                ),
                SizeConfig.verticalSpaceMedium(),
                SingleChildScrollView(
                    child: Row(
                  children: List.generate(2, (int index) {
                    return Padding(
                      padding: SizeConfig.horizontalTilePadding,
                      child: const CategoryCard(
                        isShimmer: true,
                      ),
                    );
                  }),
                ))
              ],
            );
          } else if (state is CategoryLoaded) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Row(
                    children: state.categories1
                        .map((category) => Padding(
                              padding: SizeConfig.horizontalTilePadding,
                              child: CategoryCard(category: category),
                            ))
                        .toList(),
                  ),
                ),
                SizeConfig.verticalSpaceMedium(),
                SingleChildScrollView(
                    child: Row(
                  children: state.categories2
                      .map((category) => Padding(
                            padding: SizeConfig.horizontalTilePadding,
                            child: CategoryCard(category: category),
                          ))
                      .toList(),
                ))
              ],
            );
          } else if (state is CategoryError) {
            return Center(child: Txt(state.message));
          }

          return Container();
        })
      ],
    );
  }
}
