import 'dart:convert';

Drivers driversFromJson(String str) => Drivers.fromJson(json.decode(str));

String driversToJson(Drivers data) => json.encode(data.toJson());

class Drivers {
  List<Driver>? drivers;
  bool? status;

  Drivers({
    this.drivers,
    this.status,
  });

  factory Drivers.fromJson(Map<String, dynamic> json) => Drivers(
    drivers: json["drivers"] == null ? [] : List<Driver>.from(json["drivers"]!.map((x) => Driver.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "drivers": drivers == null ? [] : List<dynamic>.from(drivers!.map((x) => x.toJson())),
    "status": status,
  };
}

class Driver {
  int? id;
  String? name;
  String? mobile;
  String? licenseNo;

  Driver({
    this.id,
    this.name,
    this.mobile,
    this.licenseNo,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    licenseNo: json["license_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "license_no": licenseNo,
  };
}
