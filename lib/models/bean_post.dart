class BeanPost {
  int? userId;
  int? id;
  String? title;
  String? body;

  BeanPost({this.userId, this.id, this.title, this.body});

  BeanPost.fromJson(dynamic json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    map["body"] = body;
    return map;
  }
}
