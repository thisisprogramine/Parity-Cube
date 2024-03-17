

import 'package:dartz/dartz.dart';
import 'package:parity_cube/src/domain/entities/deals/deals_entity.dart';

import '../entities/app_error.dart';
import '../params/deal_params.dart';
import '../repositories/parity_cube_repository.dart';
import 'usecase.dart';

class GetTopDeals extends UseCase<DealsEntity?, DealParams> {
  final ParityCubeRepository _parityCubeRepository;

  GetTopDeals(this._parityCubeRepository);

  @override
  Future<Either<AppError, DealsEntity?>> call(DealParams params) async =>
      _parityCubeRepository.getTopDeals(fromLocal: params.fromLocal, requestBody: params.toJson());
}
