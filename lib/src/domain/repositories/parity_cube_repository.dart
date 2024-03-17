import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../entities/deals/deals_entity.dart';

abstract class ParityCubeRepository {
  Future<Either<AppError,DealsEntity?>> getTopDeals({required bool fromLocal, required Map<String, dynamic> requestBody});
  Future<Either<AppError,DealsEntity?>> getPopularDeals({required bool fromLocal, required Map<String, dynamic> requestBody});
  Future<Either<AppError,DealsEntity?>> getFeaturedDeals({required bool fromLocal, required Map<String, dynamic> requestBody});

  Future<Either<AppError,void>> saveTopDeals({required Map<String, dynamic> response});
  Future<Either<AppError,void>> savePopularDeals({required Map<String, dynamic> response});
  Future<Either<AppError,void>> saveFeaturedDeals({required Map<String, dynamic> response});

  Future<Either<AppError, void>> clearDeals();
}
