
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parity_cube/src/presentation/blocs/top_deals/top_deals_cubit.dart';
import 'package:parity_cube/src/presentation/screens/home/deals_list.dart';

import '../../../widgets/error_message.dart';
import '../../../widgets/circular_progress_widget.dart';

class FragmentTop extends StatefulWidget {
  const FragmentTop({super.key});

  @override
  State<FragmentTop> createState() => _FragmentTopState();
}

class _FragmentTopState extends State<FragmentTop> {
  late ScrollController scrollController;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<TopDealsCubit>(context).loadTopDeals(fromLocal: false);
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
    return BlocBuilder<TopDealsCubit, TopDealsState>(
        builder: (context, state) {
          if(state is TopDealsLoading && state.isFirstFetch) {
            return const CircularProgressWidget();
          }

          if(state is TopDealsLoaded) {
            return DealsList(
              scrollController: scrollController,
                deals: state.topDeals
            );
          }else if(state is TopDealsLoading) {
            return DealsList(
              isLoading: true,
              scrollController: scrollController,
                deals: state.oldTopDeals
            );
          }else if(state is TopDealsError){
            return const ErrorMessage(message: 'Failed to load Top deal',);
          }else{
            return const SizedBox.shrink();
          }
        }
    );
  }
}
