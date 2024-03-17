import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/params/no_params.dart';
import '../../domain/usecases/clear_deals.dart';
import '../../injector.dart';
import '../blocs/featured_deals/featured_deals_cubit.dart';
import '../blocs/popular_deals/popular_deals_cubit.dart';
import '../blocs/top_deals/top_deals_cubit.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RefreshIndicator(
          onRefresh: () async{
            getItInstance<ClearDeals>().call(NoParams()).then((value) {
              context.read<TopDealsCubit>().loadTopDeals(isRefreshed: true);
              context.read<PopularDealsCubit>().loadPopularDeals(isRefreshed: true);
              context.read<FeaturedDealsCubit>().loadFeaturedDeals(isRefreshed: true);
            });
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(height: ScreenUtil().screenHeight - (kToolbarHeight + kTextTabBarHeight),)
          ),
        ),
        Center(
          child: Text(message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
