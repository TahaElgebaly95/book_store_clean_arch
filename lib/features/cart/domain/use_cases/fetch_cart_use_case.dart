import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/cart_model.dart';
import '../../data/repo/cart_repo.dart';

class FetchCartUseCase extends UseCase<CartData, void> {
  final CartRepo repository;

  FetchCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartData>> call([void params]) async {
    return await repository.fetchCart();
  }
}
