
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:parity_cube/src/domain/usecases/get_featured_deals.dart';
import 'package:parity_cube/src/domain/usecases/get_popular_deals.dart';
import 'package:parity_cube/src/domain/usecases/get_top_deals.dart';
import 'package:parity_cube/src/domain/usecases/save_featured_deals.dart';
import 'package:parity_cube/src/domain/usecases/save_popular_deals.dart';
import 'package:parity_cube/src/domain/usecases/save_top_deals.dart';
import 'package:parity_cube/src/presentation/blocs/featured_deals/featured_deals_cubit.dart';
import 'package:parity_cube/src/presentation/blocs/popular_deals/popular_deals_cubit.dart';
import 'package:parity_cube/src/presentation/blocs/top_deals/top_deals_cubit.dart';

import 'core/api_client.dart';
import 'data/datasources/local/app_local_datasource.dart';
import 'data/datasources/local/authentication_local_datasource.dart';
import 'data/datasources/local/parity_cube_local_datasource.dart';
import 'data/datasources/remote/app_remote_datasource.dart';
import 'data/datasources/remote/authentication_remote_datasource.dart';
import 'data/datasources/remote/parity_cube_remote_datasource.dart';
import 'data/repositories/app_repository_impl.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'data/repositories/parity_cube_repository_impl.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/parity_cube_repository.dart';
import 'domain/usecases/clear_deals.dart';

final getItInstance = GetIt.I;

Future init() async {

  // Core Instances Registrations

  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));


  // Datasource Registrations

  getItInstance.registerLazySingleton<AppRemoteDataSource>(
          () => AppRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AppLocalDataSource>(
          () => AppLocalDataSourceImpl());

  getItInstance.registerLazySingleton<ParityCubeLocalDataSource>(
          () => ParityCubeLocalDataSourceImpl());

  getItInstance.registerLazySingleton<ParityCubeRemoteDataSource>(
          () => ParityCubeRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
          () => AuthenticationLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataSourceImpl(getItInstance()));


  // Abstract Repository Registration

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
    getItInstance(),
  ));

  getItInstance.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(getItInstance(), getItInstance(), getItInstance()));

  getItInstance
      .registerLazySingleton<ParityCubeRepository>(() => ParityCubeRepositoryImpl(
    getItInstance(), getItInstance(), getItInstance(),));


  // Usecases Registrations

  getItInstance
      .registerLazySingleton<GetTopDeals>(() => GetTopDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopularDeals>(() => GetPopularDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<GetFeaturedDeals>(() => GetFeaturedDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<ClearDeals>(() => ClearDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveTopDeals>(() => SaveTopDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<SavePopularDeals>(() => SavePopularDeals(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveFeaturedDeals>(() => SaveFeaturedDeals(getItInstance()));

  // Cubits Registrations

  getItInstance.registerFactory<TopDealsCubit>(() => TopDealsCubit(
      getTopDeals: getItInstance(),
      saveTopDeals: getItInstance(),
  ));

  getItInstance.registerFactory<PopularDealsCubit>(() => PopularDealsCubit(
    getPopularDeals: getItInstance(),
    savePopularDeals: getItInstance(),
  ));

  getItInstance.registerFactory<FeaturedDealsCubit>(() => FeaturedDealsCubit(
    getFeaturedDeals: getItInstance(),
    saveFeaturedDeals: getItInstance(),
  ));
}
