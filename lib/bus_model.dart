import 'dart:convert';

Bus busFromJson(String str) => Bus.fromJson(json.decode(str));

String busToJson(Bus data) => json.encode(data.toJson());

class Bus {
  List<BusElement>? bus;
  bool? status;

  Bus({
    this.bus,
    this.status,
  });

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
    bus: json["bus"] == null ? [] : List<BusElement>.from(json["bus"]!.map((x) => BusElement.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "bus": bus == null ? [] : List<dynamic>.from(bus!.map((x) => x.toJson())),
    "status": status,
  };
}

class BusElement {
  int? id;
  String? image;
  String? name;
  String? type;
  String? driverName;
  String? driverLicenseNo;

  BusElement({
    this.id,
    this.image,
    this.name,
    this.type,
    this.driverName,
    this.driverLicenseNo,
  });

  factory BusElement.fromJson(Map<String, dynamic> json) => BusElement(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    type: json["type"],
    driverName: json["driver_name"],
    driverLicenseNo: json["driver_license_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "type": type,
    "driver_name": driverName,
    "driver_license_no": driverLicenseNo,
  };
}
