class BeanPhotos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  BeanPhotos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  BeanPhotos.fromJson(dynamic json) {
    albumId = json["albumId"];
    id = json["id"];
    title = json["title"];
    url = json["url"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["albumId"] = albumId;
    map["id"] = id;
    map["title"] = title;
    map["url"] = url;
    map["thumbnailUrl"] = thumbnailUrl;
    return map;
  }
}
