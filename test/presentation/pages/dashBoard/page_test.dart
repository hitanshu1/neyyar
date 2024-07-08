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

  testWidgets('DashBoardPage displays HomeTab initially and checks state changes', (WidgetTester tester) async {
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

    // Trigger the first state change
    mockDashBoardBloc.add(const ChangeTabDashBoardEvent(1));
    print('Event 1 added');
    await tester.pumpAndSettle();

    final currentState1 = mockDashBoardBloc.state;
    print('Current state after event 1: $currentState1');

    expect(find.byType(LiveClassTab), findsOneWidget);
    expect(find.byType(HomeTab), findsNothing);
    expect(find.byType(NotificationTab), findsNothing);
  });
}