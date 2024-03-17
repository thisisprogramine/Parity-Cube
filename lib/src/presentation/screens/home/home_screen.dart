
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parity_cube/src/injector.dart';
import 'package:parity_cube/src/presentation/blocs/featured_deals/featured_deals_cubit.dart';
import 'package:parity_cube/src/presentation/blocs/popular_deals/popular_deals_cubit.dart';
import 'package:parity_cube/src/presentation/blocs/top_deals/top_deals_cubit.dart';
import 'package:parity_cube/src/presentation/screens/home/fragments/fragment_featured.dart';
import 'package:parity_cube/src/presentation/screens/home/fragments/fragment_popular.dart';
import 'package:parity_cube/src/presentation/screens/home/fragments/fragment_top.dart';
import 'package:parity_cube/src/presentation/screens/navigation_drawer/navigation_drawer.dart';
import 'package:parity_cube/src/presentation/widgets/parity_cube_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/tab_items.dart';
import '../../theme/theme_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _controller;
  
  late TopDealsCubit topDealsCubit;
  late PopularDealsCubit popularDealsCubit;
  late FeaturedDealsCubit featuredDealsCubit;

  List<TabItem> tabItems = [
    TabItem(id: 0, title: "TOP", child: const FragmentTop()),
    TabItem(id: 1, title: "POPULAR", child: const FragmentPopular()),
    TabItem(id: 2, title: "FEATURED", child: const FragmentFeatured())
  ];

  @override
  void initState() {
    super.initState();

    topDealsCubit = getItInstance<TopDealsCubit>();
    popularDealsCubit = getItInstance<PopularDealsCubit>();
    featuredDealsCubit = getItInstance<FeaturedDealsCubit>();

    topDealsCubit.loadTopDeals();
    popularDealsCubit.loadPopularDeals();
    featuredDealsCubit.loadFeaturedDeals();

    _controller = TabController(length: tabItems.length, vsync: this);
    _controller.addListener(() {

    });
  }

  @override
  void dispose() {
    _controller.dispose();

    topDealsCubit.close();
    popularDealsCubit.close();
    featuredDealsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => topDealsCubit),
        BlocProvider(create: (context) => popularDealsCubit),
        BlocProvider(create: (context) => featuredDealsCubit),
      ],
      child: Scaffold(
        key: scaffoldKey,
        appBar: ParityCubeAppBar(
          title: 'Deals',
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.search)
            )
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: AppColor.red,
            tabs: tabItems.map((item) => Tab(text: item.title)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.red,
          onPressed: () {

          },
          child: const Icon(Icons.currency_rupee),
        ),
        drawer: const NavigationDrawer(),
        body: TabBarView(
          controller: _controller,
          children: tabItems.map((item) => item.child).toList(),
        ),
      ),
    );
  }
}
