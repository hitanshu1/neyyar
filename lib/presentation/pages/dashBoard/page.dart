import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/category/bloc.dart';
import '../../bloc/course/bloc.dart';
import '../../bloc/dashboard/bloc.dart';
import '../../bloc/dashboard/state.dart';
import '../../bloc/offer/bloc.dart';
import '../home/tab.dart';
import '../liveClass/tab.dart';
import '../notification/tab.dart';
import 'appBar.dart';
import 'bottomNavigationBar.dart';

/// dash board page
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(LoadCategories());
    context.read<CourseBloc>().add(LoadCourses());
    context.read<OfferBloc>().add(LoadOffers());

    return Scaffold(
      appBar: const DashBoardAppBar(),
      body:
          BlocBuilder<DashBoardBloc, DashBoardState>(builder: (context, state) {
        return IndexedStack(
            index: state.pageIndex,
            children: const [
              HomeTab(),
              LiveClassTab(),
              NotificationTab(),
            ],
          );
      }),
      bottomNavigationBar: const DashBoardNavigationBar(),
    );
  }

 
 
}
