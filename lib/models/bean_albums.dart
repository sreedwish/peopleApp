class BeanAlbums {
  int? userId;
  int? id;
  String? title;

  BeanAlbums({this.userId, this.id, this.title});

  BeanAlbums.fromJson(dynamic json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    return map;
  }
}
