
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/course.dart';
import '../../../domain/repositories/course.dart';

part 'event.dart';
part 'state.dart';


/// course bloc
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  /// course repository
  final CourseRepository repository;
/// constructor
  CourseBloc({required this.repository}) : super(CourseInitial()) {
    on<LoadCourses>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await repository.get();
        emit(CourseLoaded(courses: courses));
      } catch (e) {
        emit(CourseError(message: e.toString()));
      }
    });
  }
}
