class Store {
  String? name;

  Store({
    this.name,
  });

  factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}