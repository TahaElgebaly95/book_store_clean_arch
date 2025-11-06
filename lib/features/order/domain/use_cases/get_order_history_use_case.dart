import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/order_history_model.dart';
import '../../data/repo/order_repo.dart';

class GetOrderHistoryUseCase extends UseCase<OrderHistoryModel, void> {
  final OrderRepo orderRepo;

  GetOrderHistoryUseCase(this.orderRepo);

  @override
  Future<Either<Failure, OrderHistoryModel>> call([void params]) async {
    return await orderRepo.getOrderHistory();
  }
}