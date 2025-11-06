// ========== get_categories_use_case.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/home_repo.dart';
import '../entities/category_entity.dart';

class GetCategoriesUseCase {
  final HomeRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await _repository.getCategories();
  }
}