part of 'bloc.dart';

/// course event
abstract class CourseEvent extends Equatable {
  ///constructor
  const CourseEvent();

  @override
  List<Object> get props => [];
}
/// load courses

class LoadCourses extends CourseEvent {}
