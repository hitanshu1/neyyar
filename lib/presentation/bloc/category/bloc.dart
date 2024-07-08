import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/category.dart';
import '../../../domain/repositories/category.dart';
part 'event.dart';
part 'state.dart';

/// category bloc
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  /// category repository
  final CategoryRepository repository;

  /// constructor
  CategoryBloc({required this.repository}) : super(CategoryInitial()) {
    on<LoadCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories1 = await repository.get();
        final categories2 = await repository.get(type: 1);
        emit(
            CategoryLoaded(categories1: categories1, categories2: categories2));
      } catch (e) {
        emit(CategoryError(message: e.toString()));
      }
    });
  }
}
