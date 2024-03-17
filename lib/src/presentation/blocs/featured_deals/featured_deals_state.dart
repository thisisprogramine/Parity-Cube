part of 'featured_deals_cubit.dart';

abstract class FeaturedDealsState extends Equatable {
  const FeaturedDealsState();
  @override
  List<Object> get props => [];
}

class FeaturedDealsInitial extends FeaturedDealsState {}

class FeaturedDealsLoaded extends FeaturedDealsState {
  final List<DealEntity> featuredDeals;
  const FeaturedDealsLoaded({
    required this.featuredDeals
  });

  @override
  List<Object> get props => [];
}

class FeaturedDealsError extends FeaturedDealsState {
  final AppErrorType errorType;

  const FeaturedDealsError({
    required this.errorType,
  });
}

class FeaturedDealsLoading extends FeaturedDealsState {
  final List<DealEntity> oldFeaturedDeals;
  final bool isFirstFetch;
  const FeaturedDealsLoading({required this.oldFeaturedDeals, this.isFirstFetch = false});
}
