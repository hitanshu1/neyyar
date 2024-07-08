import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:neyyar/domain/repositories/category.dart';
import 'package:neyyar/domain/repositories/course.dart';
import 'package:neyyar/domain/repositories/offer.dart';
import 'package:neyyar/presentation/bloc/category/bloc.dart';
import 'package:neyyar/presentation/bloc/course/bloc.dart';
import 'package:neyyar/presentation/bloc/dashboard/bloc.dart';
import 'package:neyyar/presentation/bloc/dashboard/event.dart';
import 'package:neyyar/presentation/bloc/dashboard/state.dart';
import 'package:neyyar/presentation/bloc/offer/bloc.dart';
import 'package:neyyar/presentation/pages/dashBoard/page.dart';
import 'package:neyyar/presentation/pages/home/tab.dart';
import 'package:neyyar/presentation/pages/liveClass/tab.dart';
import 'package:neyyar/presentation/pages/notification/tab.dart';


/// Mock class for DashBoardBloc
class MockDashBoardBloc extends Mock implements DashBoardBloc {}
class MockCategoryRepository extends Mock implements CategoryRepository {}
class MockCourseRepository extends Mock implements CourseRepository {}
class MockOfferRepository extends Mock implements OfferRepository {}


void main() {
  late MockDashBoardBloc mockDashBoardBloc;
  late MockCategoryRepository mockCategoryRepository;
  late MockCourseRepository mockCourseRepository;
  late MockOfferRepository mockOfferRepository;

  setUp(() {
    mockDashBoardBloc = MockDashBoardBloc();
    mockCategoryRepository = MockCategoryRepository();
    mockCourseRepository = MockCourseRepository();
    mockOfferRepository = MockOfferRepository();

    when(() => mockDashBoardBloc.stream).thenAnswer((_) => Stream<DashBoardState>.fromIterable(<DashBoardState>[
      const DashBoardState(),
      const DashBoardState(pageIndex: 1),
      
     
    ]));

    when(() => mockDashBoardBloc.state).thenReturn(const DashBoardState());
    when(() => mockDashBoardBloc.close()).thenAnswer((_) async {});

    when(() => mockCategoryRepository.get()).thenAnswer((_) async => []);
    when(() => mockCourseRepository.get()).thenAnswer((_) async => []);
    when(() => mockOfferRepository.get()).thenAnswer((_) async => []);
  });

  tearDown(() {
    mockDashBoardBloc.close();
  });

  testWidgets('DashBoardPage displays HomeTab initially and check ', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(repository: mockCategoryRepository),
          ),
          BlocProvider(
            create: (context) => CourseBloc(repository: mockCourseRepository),
          ),
          BlocProvider(
            create: (context) => OfferBloc(repository: mockOfferRepository),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            home: BlocProvider<DashBoardBloc>(
              create: (BuildContext context) => mockDashBoardBloc,
              child: const DashBoardPage(),
            ),
          ),
        ),
      ),
    );

    print('Initial pump completed');
    expect(find.byType(HomeTab), findsOneWidget);
    expect(find.byType(LiveClassTab), findsNothing);
     expect(find.byType(NotificationTab), findsNothing);

    mockDashBoardBloc.add(const ChangeTabDashBoardEvent(1));
    print('Event added');

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump();
    print('Manual pump completed');

    expect(find.byType(LiveClassTab), findsOneWidget);
    expect(find.byType(HomeTab), findsNothing);
    expect(find.byType(NotificationTab), findsNothing);
    
  });
}

