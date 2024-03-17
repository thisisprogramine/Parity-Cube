
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parity_cube/src/config/constants/size_constants.dart';
import 'package:parity_cube/src/config/extension/size_extensions.dart';
import 'package:parity_cube/src/domain/entities/deals/deals_entity.dart';
import 'package:parity_cube/src/domain/params/no_params.dart';
import 'package:parity_cube/src/domain/usecases/clear_deals.dart';
import 'package:parity_cube/src/injector.dart';
import 'package:parity_cube/src/presentation/blocs/top_deals/top_deals_cubit.dart';

import '../../blocs/featured_deals/featured_deals_cubit.dart';
import '../../blocs/popular_deals/popular_deals_cubit.dart';
import 'deals_list_item.dart';

class DealsList extends StatelessWidget {
  final List<DealEntity> deals;
  final ScrollController scrollController;
  final bool isLoading;
  const DealsList({
    super.key,
    required this.deals,
    required this.scrollController,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        getItInstance<ClearDeals>().call(NoParams()).then((value) {
          context.read<TopDealsCubit>().loadTopDeals(isRefreshed: true);
          context.read<PopularDealsCubit>().loadPopularDeals(isRefreshed: true);
          context.read<FeaturedDealsCubit>().loadFeaturedDeals(isRefreshed: true);
        });
      },
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: deals.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if(index < deals.length) {
              DealEntity deal = deals[index];
              return DealsListItem(deal: deal);
            }else{
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_14, vertical: Sizes.dimen_8.h),
                child: const LinearProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
