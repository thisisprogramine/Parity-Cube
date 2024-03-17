

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/deals/deals_entity.dart';
import '../../../domain/params/deal_params.dart';
import '../../../domain/usecases/get_featured_deals.dart';
import '../../../domain/usecases/save_featured_deals.dart';

part 'featured_deals_state.dart';

class FeaturedDealsCubit
    extends Cubit<FeaturedDealsState> {
  int page = 1;
  final GetFeaturedDeals getFeaturedDeals;
  final SaveFeaturedDeals saveFeaturedDeals;

  FeaturedDealsCubit({
    required this.getFeaturedDeals,
    required this.saveFeaturedDeals
  }): super(FeaturedDealsInitial());

  Future<void> loadFeaturedDeals({bool isRefreshed = false, bool fromLocal = true}) async {

    final Either<AppError, DealsEntity?> dealsFromLocal = await getFeaturedDeals(DealParams(fromLocal: true, page: page));

    dealsFromLocal.fold((error) {

    }, (dealsFormLocal) async{

      if (state is FeaturedDealsLoading) return;

      page = (dealsFormLocal?.currentPage ?? 0) + 1;
      if(isRefreshed) page = 1;
      final currentState = state;
      var oldFeaturedDeals = dealsFormLocal?.dealList ?? <DealEntity>[];

      if (currentState is FeaturedDealsLoaded && !isRefreshed) {
        oldFeaturedDeals = currentState.featuredDeals;
      }

      emit(FeaturedDealsLoading(oldFeaturedDeals: oldFeaturedDeals, isFirstFetch: page == 1));

      final Either<AppError, DealsEntity?> featuredDeals = await getFeaturedDeals(DealParams(fromLocal: fromLocal && dealsFormLocal != null, page: page));

      featuredDeals.fold((error) {
        emit(FeaturedDealsError(errorType: error.appErrorType));
      }, (deals) {
        // page++;

        final featuredDeals = (state as FeaturedDealsLoading).oldFeaturedDeals;
        featuredDeals.addAll(deals?.dealList ?? []);

        emit(FeaturedDealsLoaded(featuredDeals: featuredDeals));
      });
    });

  }
}
