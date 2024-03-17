
import 'package:parity_cube/src/data/models/deals/store.dart';

import '../../../domain/entities/deals/deals_entity.dart';

class DealModel extends DealEntity{
  @override
  int? id;
  @override
  int? commentsCount;
  @override
  DateTime? createdAt;
  @override
  int? createdAtInMillis;
  @override
  String? imageMedium;
  Store? store;

  DealModel({
    this.id,
    this.commentsCount,
    this.createdAt,
    this.createdAtInMillis,
    this.imageMedium,
    this.store,
  }) : super(
      id: id,
      commentsCount: commentsCount,
      createdAt: createdAt,
      createdAtInMillis: createdAtInMillis,
      imageMedium: imageMedium,
      storeName: store?.name
  );

  factory DealModel.fromJson(Map<dynamic, dynamic> json) => DealModel(
    id: json["id"],
    commentsCount: json["comments_count"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdAtInMillis: json["created_at_in_millis"],
    imageMedium: json["image_medium"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comments_count": commentsCount,
    "created_at": createdAt?.toIso8601String(),
    "created_at_in_millis": createdAtInMillis,
    "image_medium": imageMedium,
    "store": store?.toJson(),
  };
}