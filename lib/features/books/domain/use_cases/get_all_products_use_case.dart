import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/all_products_books.dart';
import '../../data/repo/all_products_repo.dart';

class GetAllProductsUseCase extends UseCase<AllProductsBooksModel, void> {
  final AllProductsRepo allProductsRepo;

  GetAllProductsUseCase(this.allProductsRepo);

  @override
  Future<Either<Failure, AllProductsBooksModel>> call([void params]) async {
    return await allProductsRepo.getAllProducts();
  }
}