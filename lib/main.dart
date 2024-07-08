
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'core/utils/navigationService.dart';

import 'domain/repositories/category.dart';
import 'domain/repositories/course.dart';
import 'domain/repositories/offer.dart';
import 'presentation/bloc/category/bloc.dart';
import 'presentation/bloc/course/bloc.dart';
import 'presentation/bloc/dashboard/bloc.dart';

import 'presentation/bloc/offer/bloc.dart';
import 'routes/appRoutes.dart';
import 'theme.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

/// Main App
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: [
           
          BlocProvider(create: (context) => DashBoardBloc()),
       BlocProvider(
          create: (context) => CategoryBloc(repository: CategoryRepository.instance),
        ),
        BlocProvider(
          create: (context) => CourseBloc(repository: CourseRepository.instance),
        ),
        BlocProvider(create: (context)=> OfferBloc(repository: OfferRepository.instance))
             ],
        child: ScreenUtilInit(
          designSize: MediaQuery.sizeOf(context),
          builder: (context,child) {
            return  MaterialApp(
              navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: theme(false),
              themeMode: ThemeMode.light,
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: AppRoutes.initialRoute,
        
            );
          }
        ),
      ),
    );
  }
}
