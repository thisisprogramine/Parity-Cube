
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/popular_deals/popular_deals_cubit.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/circular_progress_widget.dart';
import '../deals_list.dart';

class FragmentPopular extends StatefulWidget {
  const FragmentPopular({super.key});

  @override
  State<FragmentPopular> createState() => _FragmentPopularState();
}

class _FragmentPopularState extends State<FragmentPopular> {
  late ScrollController scrollController;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PopularDealsCubit>(context).loadPopularDeals(fromLocal: false);
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
    return BlocBuilder<PopularDealsCubit, PopularDealsState>(
        builder: (context, state) {
          if(state is PopularDealsLoading && state.isFirstFetch) {
            return const CircularProgressWidget();
          }

          if(state is PopularDealsLoaded) {
            return DealsList(
                scrollController: scrollController,
                deals: state.popularDeals
            );
          }else if(state is PopularDealsLoading) {
            return DealsList(
                isLoading: true,
                scrollController: scrollController,
                deals: state.oldPopularDeals
            );
          }else if(state is PopularDealsError){
            return const ErrorMessage(message: 'failed to load Feature deal',);
          }else{
            return const SizedBox.shrink();
          }
        }
    );
  }
}
