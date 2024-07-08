part of 'bloc.dart';

/// course state
abstract class CourseState extends Equatable {
  ///constructor
  const CourseState();

  @override
  List<Object> get props => [];
}
/// course initial state
class CourseInitial extends CourseState {}
/// course loading
class CourseLoading extends CourseState {}

/// course loaded
class CourseLoaded extends CourseState {
  /// list of courses
  final List<Course> courses;
/// constructor
  const CourseLoaded({required this.courses});

  @override
  List<Object> get props => [courses];
}
/// course error
class CourseError extends CourseState {
  /// error message
  final String message;
///constructor

  const CourseError({required this.message});

  @override
  List<Object> get props => [message];
}
