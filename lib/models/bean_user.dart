class BeanUser {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  BeanUser(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  BeanUser.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"] ?? '';
    username = json["username"];
    email = json["email"];
    address =
        json["address"] != null ? Address.fromJson(json["address"]) : null;
    phone = json["phone"];
    website = json["website"];
    company =
        json["company"] != null ? Company.fromJson(json["company"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["username"] = username;
    map["email"] = email;
    if (address != null) {
      map["address"] = address?.toJson();
    }
    map["phone"] = phone;
    map["website"] = website;
    if (company != null) {
      map["company"] = company?.toJson();
    }
    return map;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(dynamic json) {
    name = json["name"] ?? 'unknown';
    catchPhrase = json["catchPhrase"];
    bs = json["bs"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["catchPhrase"] = catchPhrase;
    map["bs"] = bs;
    return map;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(dynamic json) {
    street = json["street"];
    suite = json["suite"];
    city = json["city"];
    zipcode = json["zipcode"];
    geo = json["geo"] != null ? Geo.fromJson(json["geo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["street"] = street;
    map["suite"] = suite;
    map["city"] = city;
    map["zipcode"] = zipcode;
    if (geo != null) {
      map["geo"] = geo?.toJson();
    }
    return map;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lng"] = lng;
    return map;
  }
}
