
import 'package:dartz/dartz.dart';

import '../../core/unathorised_exception.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/repositories/parity_cube_repository.dart';
import '../datasources/local/app_local_datasource.dart';
import '../datasources/local/parity_cube_local_datasource.dart';
import '../datasources/remote/parity_cube_remote_datasource.dart';
import '../models/deals/deals_model.dart';

class ParityCubeRepositoryImpl extends ParityCubeRepository {
  final AppLocalDataSource _appLocalDataSource;
  final ParityCubeLocalDataSource _parityCubeLocalDataSource;
  final ParityCubeRemoteDataSource _parityCubeRemoteDataSource;

  ParityCubeRepositoryImpl(this._appLocalDataSource, this._parityCubeLocalDataSource, this._parityCubeRemoteDataSource);

  @override
  Future<Either<AppError, DealsModel?>> getTopDeals({required bool fromLocal, required Map<String, dynamic> requestBody}) async{
    try{
      final responseLocal = await _parityCubeLocalDataSource.getTopDeals();
      if(fromLocal) {
        return Right(responseLocal);
      }else {
        final responseRemote = await _parityCubeRemoteDataSource.getTopDeals(requestBody: requestBody);
        responseLocal?.addDeals(responseRemote.deals ?? []);
        await _parityCubeLocalDataSource.saveTopDeals(
            requestBody: requestBody,
            response: responseLocal == null
                ? responseRemote.toJson()
                : responseLocal.toJson()
        );
        return Right(responseRemote);
      }
    }on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    }  on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveTopDeals({required Map<String, dynamic> response}) async{
    final r = await _parityCubeLocalDataSource.saveTopDeals(requestBody: {}, response: response);
    return Right(r);
  }

  @override
  Future<Either<AppError, DealsModel?>> getPopularDeals({required bool fromLocal, required Map<String, dynamic> requestBody}) async{
    try{
      final responseLocal = await _parityCubeLocalDataSource.getPopularDeals();
      if(fromLocal) {
        return Right(responseLocal);
      }else {
        final responseRemote = await _parityCubeRemoteDataSource.getPopularDeals(requestBody: requestBody);
        responseLocal?.addDeals(responseRemote.deals ?? []);
        await _parityCubeLocalDataSource.savePopularDeals(
            requestBody: requestBody,
            response: responseLocal == null
                ? responseRemote.toJson()
                : responseLocal.toJson()
        );
        return Right(responseRemote);
      }
    }on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    }  on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> savePopularDeals({required Map<String, dynamic> response}) async{
    final r = await _parityCubeLocalDataSource.savePopularDeals(requestBody: {}, response: response);
    return Right(r);
  }

  @override
  Future<Either<AppError, DealsModel?>> getFeaturedDeals({required bool fromLocal, required Map<String, dynamic> requestBody}) async{
    try{
      final responseLocal = await _parityCubeLocalDataSource.getFeaturedDeals();
      if(fromLocal) {
        return Right(responseLocal);
      }else {
        final responseRemote = await _parityCubeRemoteDataSource.getFeaturedDeals(requestBody: requestBody);
        responseLocal?.addDeals(responseRemote.deals ?? []);
        await _parityCubeLocalDataSource.saveFeaturedDeals(
            requestBody: requestBody,
            response: responseLocal == null
                ? responseRemote.toJson()
                : responseLocal.toJson()
        );
        return Right(responseRemote);
      }
    }on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    }  on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveFeaturedDeals({required Map<String, dynamic> response}) async{
    final r = await _parityCubeLocalDataSource.savePopularDeals(requestBody: {}, response: response);
    return Right(r);
  }

  @override
  Future<Either<AppError, void>> clearDeals() async{
    try{
      final response = await _parityCubeLocalDataSource.clearDeals();
      return Right(response);
    }on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    }  on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}