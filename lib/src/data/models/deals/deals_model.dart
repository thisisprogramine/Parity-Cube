import '../../../domain/entities/deals/deals_entity.dart';
import 'deal_model.dart';
import 'seo_settings.dart';

class DealsModel extends DealsEntity{
  SeoSettings? seoSettings;
  List<DealModel>? deals;
  @override
  int? currentPage;

  DealsModel({
    this.seoSettings,
    this.deals,
    this.currentPage,
  }) : super(
      dealList: deals ?? [],
    currentPage: currentPage
  );

  void addDeals(List<DealModel> dealList) {
    deals?.addAll(dealList);
  }

  factory DealsModel.fromJson(Map<dynamic, dynamic> json) => DealsModel(
    seoSettings: json["seo_settings"] == null ? null : SeoSettings.fromJson(json["seo_settings"]),
    currentPage: json["currentPage"] == null ? null : json["currentPage"]!,
    deals: json["deals"] == null ? [] : List<DealModel>.from(json["deals"]!.map((x) => DealModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "seo_settings": seoSettings?.toJson(),
    "currentPage": currentPage,
    "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x.toJson())),
  };
}