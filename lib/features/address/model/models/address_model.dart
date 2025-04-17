import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));
String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  int? addressId;
  int? provinceId;
  String provinceName;
  int? districtId;
  String districtName;
  int? subDistrictId;
  String subDistrictName;
  String cityCode;
  String npwpFile;
  DateTime? createdAt;
  DateTime? updatedAt;
  String deletedAt;
  String service;
  String addressType;
  String addressLabel;
  String name;
  String countryName;
  String address;
  String postalCode;
  double? long;
  double? lat;
  String addressMap;
  String email;
  String phoneNumber;
  String phoneNumber2;
  String npwp;
  bool isPrimary;
  String note;
  int? customer;
  int? province;
  int? district;
  int? subDistrict;
  int? country;

  AddressModel({
    this.addressId,
    this.provinceId,
    this.districtId,
    this.subDistrictId,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.province,
    this.district,
    this.subDistrict,
    this.country,
    this.long,
    this.lat,
    required this.provinceName,
    required this.districtName,
    required this.subDistrictName,
    required this.cityCode,
    required this.npwpFile,
    required this.deletedAt,
    required this.service,
    required this.addressType,
    required this.addressLabel,
    required this.name,
    required this.countryName,
    required this.address,
    required this.postalCode,
    required this.addressMap,
    required this.email,
    required this.phoneNumber,
    required this.phoneNumber2,
    required this.npwp,
    required this.isPrimary,
    required this.note,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    addressId: json["address_id"],
    provinceId: json["province_id"],
    provinceName: json["province_name"] ?? '',
    districtId: json["district_id"],
    districtName: json["district_name"] ?? '',
    subDistrictId: json["sub_district_id"],
    subDistrictName: json["sub_district_name"] ?? '',
    cityCode: json["city_code"] ?? '',
    npwpFile: json["npwp_file"]?.toString() ?? '',
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"]?.toString() ?? '',
    service: json["service"] ?? '',
    addressType: json["address_type"] ?? '',
    addressLabel: json["address_label"] ?? '',
    name: json["name"] ?? '',
    countryName: json["country_name"] ?? '',
    address: json["address"] ?? '',
    postalCode: json["postal_code"] ?? '',
    long: json["long"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
    addressMap: json["address_map"] ?? '',
    email: json["email"] ?? '',
    phoneNumber: json["phone_number"] ?? '',
    phoneNumber2: json["phone_number_2"]?.toString() ?? '',
    npwp: json["npwp"]?.toString() ?? '',
    isPrimary: json["is_primary"] ?? false,
    note: json["note"]?.toString() ?? '',
    customer: json["customer"],
    province: json["province"],
    district: json["district"],
    subDistrict: json["sub_district"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "province_id": provinceId,
    "province_name": provinceName,
    "district_id": districtId,
    "district_name": districtName,
    "sub_district_id": subDistrictId,
    "sub_district_name": subDistrictName,
    "city_code": cityCode,
    "npwp_file": npwpFile,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "service": service,
    "address_type": addressType,
    "address_label": addressLabel,
    "name": name,
    "country_name": countryName,
    "address": address,
    "postal_code": postalCode,
    "long": long,
    "lat": lat,
    "address_map": addressMap,
    "email": email,
    "phone_number": phoneNumber,
    "phone_number_2": phoneNumber2,
    "npwp": npwp,
    "is_primary": isPrimary,
    "note": note,
    "customer": customer,
    "province": province,
    "district": district,
    "sub_district": subDistrict,
    "country": country,
  };
}
