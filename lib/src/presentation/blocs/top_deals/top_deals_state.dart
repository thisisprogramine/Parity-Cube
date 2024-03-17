part of 'top_deals_cubit.dart';

abstract class TopDealsState extends Equatable {
  const TopDealsState();
  @override
  List<Object> get props => [];
}

class TopDealsInitial extends TopDealsState {}

class TopDealsLoaded extends TopDealsState {
  final List<DealEntity> topDeals;
  const TopDealsLoaded({
    required this.topDeals
  });

  @override
  List<Object> get props => [];
}

class TopDealsError extends TopDealsState {
  final AppErrorType errorType;

  const TopDealsError({
    required this.errorType,
  });
}

class TopDealsLoading extends TopDealsState {
  final List<DealEntity> oldTopDeals;
  final bool isFirstFetch;
  const TopDealsLoading({required this.oldTopDeals, this.isFirstFetch = false});
}
