class DealParams {
  final bool fromLocal;
  final int page;
  const DealParams({this.fromLocal = false, required this.page});

  Map<String, dynamic> toJson() => {
    'page': page,
  };
}