

import 'package:dartz/dartz.dart';
import 'package:parity_cube/src/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../repositories/parity_cube_repository.dart';

class SavePopularDeals extends UseCase<void, Map<String, dynamic>> {
  final ParityCubeRepository _parityCubeRepository;

  SavePopularDeals(this._parityCubeRepository);

  @override
  Future<Either<AppError, void>> call(Map<String, dynamic> response) async =>
      _parityCubeRepository.savePopularDeals(response: response);
}
