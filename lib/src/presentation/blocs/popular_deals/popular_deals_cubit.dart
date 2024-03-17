

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/deals/deals_entity.dart';
import '../../../domain/params/deal_params.dart';
import '../../../domain/usecases/get_popular_deals.dart';
import '../../../domain/usecases/save_popular_deals.dart';

part 'popular_deals_state.dart';

class PopularDealsCubit
    extends Cubit<PopularDealsState> {
  int page = 1;
  final GetPopularDeals getPopularDeals;
  final SavePopularDeals savePopularDeals;

  PopularDealsCubit({
    required this.getPopularDeals,
    required this.savePopularDeals
  }): super(PopularDealsInitial());

  Future<void> loadPopularDeals({bool isRefreshed = false, bool fromLocal = true}) async {

    final Either<AppError, DealsEntity?> dealsFromLocal = await getPopularDeals(DealParams(fromLocal: true, page: page));

    dealsFromLocal.fold((error) {

    }, (dealsFormLocal) async{

      if (state is PopularDealsLoading) return;

      page = (dealsFormLocal?.currentPage ?? 0) + 1;
      if(isRefreshed) page = 1;
      final currentState = state;
      var oldPopularDeals = dealsFormLocal?.dealList ?? <DealEntity>[];

      if (currentState is PopularDealsLoaded && !isRefreshed) {
        oldPopularDeals = currentState.popularDeals;
      }

      emit(PopularDealsLoading(oldPopularDeals: oldPopularDeals, isFirstFetch: page == 1));

      final Either<AppError, DealsEntity?> popularDeals = await getPopularDeals(DealParams(fromLocal: fromLocal && dealsFormLocal != null, page: page));
      popularDeals.fold((error) {
        emit(PopularDealsError(errorType: error.appErrorType));
      }, (deals) {
        // page++;

        final popularDeals = (state as PopularDealsLoading).oldPopularDeals;
        popularDeals.addAll(deals?.dealList ?? []);

        emit(PopularDealsLoaded(popularDeals: popularDeals));
      });
    });

  }
}
