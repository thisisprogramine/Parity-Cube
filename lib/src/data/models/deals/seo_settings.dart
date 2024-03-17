class SeoSettings {
  String? seoTitle;
  String? seoDescription;
  String? webUrl;

  SeoSettings({
    this.seoTitle,
    this.seoDescription,
    this.webUrl,
  });

  factory SeoSettings.fromJson(Map<dynamic, dynamic> json) => SeoSettings(
    seoTitle: json["seo_title"],
    seoDescription: json["seo_description"],
    webUrl: json["web_url"],
  );

  Map<String, dynamic> toJson() => {
    "seo_title": seoTitle,
    "seo_description": seoDescription,
    "web_url": webUrl,
  };
}