
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/featured_deals/featured_deals_cubit.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/circular_progress_widget.dart';
import '../deals_list.dart';

class FragmentFeatured extends StatefulWidget {
  const FragmentFeatured({super.key});

  @override
  State<FragmentFeatured> createState() => _FragmentFeaturedState();
}

class _FragmentFeaturedState extends State<FragmentFeatured> {
  late ScrollController scrollController;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<FeaturedDealsCubit>(context).loadFeaturedDeals(fromLocal: false);
        }
      }
    });
  }

  @override
  void initState() {
    scrollController = ScrollController();
    setupScrollController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedDealsCubit, FeaturedDealsState>(
        builder: (context, state) {
          if(state is FeaturedDealsLoading && state.isFirstFetch) {
            return const CircularProgressWidget();
          }

          if(state is FeaturedDealsLoaded) {
            return DealsList(
                scrollController: scrollController,
                deals: state.featuredDeals
            );
          }else if(state is FeaturedDealsLoading) {
            return DealsList(
                isLoading: true,
                scrollController: scrollController,
                deals: state.oldFeaturedDeals
            );
          }else if(state is FeaturedDealsError){
            return const ErrorMessage(message: 'Failed to load Feature deal',);
          }else{
            return const SizedBox.shrink();
          }
        }
    );
  }
}
