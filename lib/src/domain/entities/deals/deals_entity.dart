
class DealsEntity{
  List<DealEntity> dealList;
  int? currentPage;

  DealsEntity({this.currentPage, required this.dealList});
}

class DealEntity {
  int? id;
  int? commentsCount;
  DateTime? createdAt;
  int? createdAtInMillis;
  String? imageMedium;
  String? storeName;

  DealEntity({
    this.id,
    this.commentsCount,
    this.createdAt,
    this.createdAtInMillis,
    this.imageMedium,
    this.storeName,
  });
}