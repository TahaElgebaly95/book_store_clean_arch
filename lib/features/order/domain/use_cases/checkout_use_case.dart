import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/ckechout_model.dart';
import '../../data/repo/order_repo.dart';

class CheckoutUseCase extends UseCase<CheckOutModel, void> {
  final OrderRepo orderRepo;

  CheckoutUseCase(this.orderRepo);

  @override
  Future<Either<Failure, CheckOutModel>> call([void params]) async {
    return await orderRepo.getCheckout();
  }
}