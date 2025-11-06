import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/show_single_order_model.dart';
import '../../data/repo/order_repo.dart';

class ShowSingleOrderUseCase extends UseCase<ShowSingleOrderModel, int> {
  final OrderRepo _orderRepo;

  ShowSingleOrderUseCase(this._orderRepo);

  @override
  Future<Either<Failure, ShowSingleOrderModel>> call([int? orderId]) async {
    if (orderId == null) {
      return Left(ServerFailure('Order ID is required'));
    }
    return await _orderRepo.showSingleOrder(orderId);
  }
}