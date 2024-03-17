

import 'package:dartz/dartz.dart';
import 'package:parity_cube/src/domain/entities/deals/deals_entity.dart';
import 'package:parity_cube/src/domain/params/deal_params.dart';

import '../entities/app_error.dart';
import '../repositories/parity_cube_repository.dart';
import 'usecase.dart';

class GetPopularDeals extends UseCase<DealsEntity?, DealParams> {
  final ParityCubeRepository _parityCubeRepository;

  GetPopularDeals(this._parityCubeRepository);

  @override
  Future<Either<AppError, DealsEntity?>> call(DealParams params) async =>
      _parityCubeRepository.getPopularDeals(fromLocal: params.fromLocal, requestBody: params.toJson());
}
