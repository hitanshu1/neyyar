part of 'bloc.dart';

/// category state
abstract class CategoryState extends Equatable {
  ///constructor
  const CategoryState();

  @override
  List<Object> get props => [];
}

/// category initial state

class CategoryInitial extends CategoryState {}

/// category loading
class CategoryLoading extends CategoryState {}

/// category loaded
class CategoryLoaded extends CategoryState {
  /// list of categories
  final List<Category> categories1, categories2;

  ///constructor
  const CategoryLoaded({required this.categories1, required this.categories2});

  @override
  List<Object> get props => [categories1, categories2];
}

/// category error
class CategoryError extends CategoryState {
  /// error message
  final String message;

  /// constructor
  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
