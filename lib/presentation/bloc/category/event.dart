part of 'bloc.dart';

/// category event
abstract class CategoryEvent extends Equatable {
  /// constructor
  const CategoryEvent();

  @override
  List<Object> get props => [];
}
/// category load event
class LoadCategories extends CategoryEvent {}
