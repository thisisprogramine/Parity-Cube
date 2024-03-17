

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parity_cube/src/domain/params/deal_params.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/deals/deals_entity.dart';
import '../../../domain/usecases/get_top_deals.dart';
import '../../../domain/usecases/save_top_deals.dart';

part 'top_deals_state.dart';

class TopDealsCubit
    extends Cubit<TopDealsState> {
  int page = 1;
  final GetTopDeals getTopDeals;
  final SaveTopDeals saveTopDeals;

  TopDealsCubit({
    required this.getTopDeals,
    required this.saveTopDeals
  }): super(TopDealsInitial());

  Future<void> loadTopDeals({bool isRefreshed = false, bool fromLocal = true}) async {

    final Either<AppError, DealsEntity?> dealsFromLocal = await getTopDeals(DealParams(fromLocal: true, page: page));

    dealsFromLocal.fold((error) {

    }, (dealsFormLocal) async{

      if (state is TopDealsLoading) return;

      page = (dealsFormLocal?.currentPage ?? 0) + 1;
      if(isRefreshed) page = 1;
      final currentState = state;
      var oldTopDeals = dealsFormLocal?.dealList ?? <DealEntity>[];

      if (currentState is TopDealsLoaded && !isRefreshed) {
        oldTopDeals = currentState.topDeals;
      }

      emit(TopDealsLoading(oldTopDeals: oldTopDeals, isFirstFetch: page == 1));

      final Either<AppError, DealsEntity?> topDeals = await getTopDeals(DealParams(fromLocal: fromLocal && dealsFormLocal != null, page: page));

      topDeals.fold((error) {
        emit(TopDealsError(errorType: error.appErrorType));
      }, (deals) {
        // page++;

        final topDeals = (state as TopDealsLoading).oldTopDeals;
        topDeals.addAll(deals?.dealList ?? []);

        emit(TopDealsLoaded(topDeals: topDeals));
      });
    });

  }
}
