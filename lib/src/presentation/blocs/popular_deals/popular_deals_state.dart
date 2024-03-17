part of 'popular_deals_cubit.dart';

abstract class PopularDealsState extends Equatable {
  const PopularDealsState();
  @override
  List<Object> get props => [];
}

class PopularDealsInitial extends PopularDealsState {}

class PopularDealsLoaded extends PopularDealsState {
  final List<DealEntity> popularDeals;
  const PopularDealsLoaded({
    required this.popularDeals
  });

  @override
  List<Object> get props => [];
}

class PopularDealsError extends PopularDealsState {
  final AppErrorType errorType;

  const PopularDealsError({
    required this.errorType,
  });
}

class PopularDealsLoading extends PopularDealsState {
  final List<DealEntity> oldPopularDeals;
  final bool isFirstFetch;
  const PopularDealsLoading({required this.oldPopularDeals, this.isFirstFetch = false});
}
