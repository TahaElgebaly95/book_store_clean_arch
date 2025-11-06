// ========== get_sliders_use_case.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/home_repo.dart';
import '../entities/silder_entity.dart';

class GetSlidersUseCase {
  final HomeRepository _repository;

  GetSlidersUseCase(this._repository);

  Future<Either<Failure, List<SliderEntity>>> call() async {
    return await _repository.getSliders();
  }
}