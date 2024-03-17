

import 'package:dartz/dartz.dart';
import 'package:parity_cube/src/domain/repositories/parity_cube_repository.dart';
import 'package:parity_cube/src/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../params/no_params.dart';

class ClearDeals extends UseCase<void, NoParams> {
  final ParityCubeRepository _parityCubeRepository;

  ClearDeals(this._parityCubeRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
      await _parityCubeRepository.clearDeals();
}
