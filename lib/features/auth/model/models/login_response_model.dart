// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  bool? login;
  String token;
  DateTime? tokenExpiryDate;
  Customer? customer;
  String company;

  LoginResponseModel({
    this.login,
    this.token = '',
    this.tokenExpiryDate,
    this.customer,
    this.company = '',
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        login: json["login"] as bool?,
        token: json["token"] == null ? '' : json["token"] as String,
        tokenExpiryDate:
            json["token_expiry_date"] == null
                ? null
                : DateTime.tryParse(json["token_expiry_date"] as String),
        customer:
            json["customer"] == null
                ? null
                : Customer.fromJson(json["customer"] as Map<String, dynamic>),
        company: json["company"] == null ? '' : json["company"] as String,
      );

  Map<String, dynamic> toJson() => {
    "login": login,
    "token": token,
    "token_expiry_date": tokenExpiryDate?.toIso8601String(),
    "customer": customer?.toJson(),
    "company": company,
  };
}

class Customer {
  int? customerId;
  String email;
  String phoneNumber;
  String phoneNumber2;
  bool? isShowWarehouseAir;
  bool? isShowWarehouseSea;
  String avatar;
  bool? membershipAlmostExpired;
  String company;
  String idCardValidation;
  bool? isAllowChina;
  DateTime? createdAt;
  DateTime? updatedAt;
  String deletedAt;
  String username;
  String firstName;
  String lastName;
  String gender;
  String birthPlace;
  String birthday;
  String nationality;
  String marketer;
  String idCardNumber;
  String idCardImage;
  String idCardName;
  String idCardAddress;
  String idCardValidationStatus;
  String status;
  String customerType;
  String referralCode;
  bool? isCompanyCustomer;
  bool? isPphCustomer;
  String registerCode;
  String googleId;
  String googleLink;
  String facebookId;
  String facebookLink;
  String appleId;
  String statusPaylater;
  int? paylaterUsed;
  int? paylaterLimit;
  String statusPayonarrival;
  String membershipType;
  int? membershipSaldo;
  String membershipExpiryDate;
  bool? isShowShowcase;
  bool? isHaveTransaction;
  String additionalJson;
  String additionalJson2;
  String nurturerTag;
  String salesTag;
  String salesTagAir;
  String salesTagSea;

  Customer({
    this.customerId,
    this.email = '',
    this.phoneNumber = '',
    this.phoneNumber2 = '',
    this.isShowWarehouseAir,
    this.isShowWarehouseSea,
    this.avatar = '',
    this.membershipAlmostExpired,
    this.company = '',
    this.idCardValidation = '',
    this.isAllowChina,
    this.createdAt,
    this.updatedAt,
    this.deletedAt = '',
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.birthPlace = '',
    this.birthday = '',
    this.nationality = '',
    this.marketer = '',
    this.idCardNumber = '',
    this.idCardImage = '',
    this.idCardName = '',
    this.idCardAddress = '',
    this.idCardValidationStatus = '',
    this.status = '',
    this.customerType = '',
    this.referralCode = '',
    this.isCompanyCustomer,
    this.isPphCustomer,
    this.registerCode = '',
    this.googleId = '',
    this.googleLink = '',
    this.facebookId = '',
    this.facebookLink = '',
    this.appleId = '',
    this.statusPaylater = '',
    this.paylaterUsed,
    this.paylaterLimit,
    this.statusPayonarrival = '',
    this.membershipType = '',
    this.membershipSaldo,
    this.membershipExpiryDate = '',
    this.isShowShowcase,
    this.isHaveTransaction,
    this.additionalJson = '',
    this.additionalJson2 = '',
    this.nurturerTag = '',
    this.salesTag = '',
    this.salesTagAir = '',
    this.salesTagSea = '',
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"] as int?,
    email: json["email"] == null ? '' : json["email"] as String,
    phoneNumber:
        json["phone_number"] == null ? '' : json["phone_number"] as String,
    phoneNumber2:
        json["phone_number_2"] == null ? '' : json["phone_number_2"] as String,
    isShowWarehouseAir: json["is_show_warehouse_air"] as bool?,
    isShowWarehouseSea: json["is_show_warehouse_sea"] as bool?,
    avatar: json["avatar"] == null ? '' : json["avatar"] as String,
    membershipAlmostExpired: json["membership_almost_expired"] as bool?,
    company: json["company"] == null ? '' : json["company"] as String,
    idCardValidation:
        json["id_card_validation"] == null
            ? ''
            : json["id_card_validation"] as String,
    isAllowChina: json["is_allow_china"] as bool?,
    createdAt:
        json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"] as String),
    updatedAt:
        json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"] as String),
    deletedAt: json["deleted_at"] == null ? '' : json["deleted_at"] as String,
    username: json["username"] == null ? '' : json["username"] as String,
    firstName: json["first_name"] == null ? '' : json["first_name"] as String,
    lastName: json["last_name"] == null ? '' : json["last_name"] as String,
    gender: json["gender"] == null ? '' : json["gender"] as String,
    birthPlace:
        json["birth_place"] == null ? '' : json["birth_place"] as String,
    birthday: json["birthday"] == null ? '' : json["birthday"] as String,
    nationality:
        json["nationality"] == null ? '' : json["nationality"] as String,
    marketer: json["marketer"] == null ? '' : json["marketer"] as String,
    idCardNumber:
        json["id_card_number"] == null ? '' : json["id_card_number"] as String,
    idCardImage:
        json["id_card_image"] == null ? '' : json["id_card_image"] as String,
    idCardName:
        json["id_card_name"] == null ? '' : json["id_card_name"] as String,
    idCardAddress:
        json["id_card_address"] == null
            ? ''
            : json["id_card_address"] as String,
    idCardValidationStatus:
        json["id_card_validation_status"] == null
            ? ''
            : json["id_card_validation_status"] as String,
    status: json["status"] == null ? '' : json["status"] as String,
    customerType:
        json["customer_type"] == null ? '' : json["customer_type"] as String,
    referralCode:
        json["referral_code"] == null ? '' : json["referral_code"] as String,
    isCompanyCustomer: json["is_company_customer"] as bool?,
    isPphCustomer: json["is_pph_customer"] as bool?,
    registerCode:
        json["register_code"] == null ? '' : json["register_code"] as String,
    googleId: json["google_id"] == null ? '' : json["google_id"] as String,
    googleLink:
        json["google_link"] == null ? '' : json["google_link"] as String,
    facebookId:
        json["facebook_id"] == null ? '' : json["facebook_id"] as String,
    facebookLink:
        json["facebook_link"] == null ? '' : json["facebook_link"] as String,
    appleId: json["apple_id"] == null ? '' : json["apple_id"] as String,
    statusPaylater:
        json["status_paylater"] == null
            ? ''
            : json["status_paylater"] as String,
    paylaterUsed: json["paylater_used"] as int?,
    paylaterLimit: json["paylater_limit"] as int?,
    statusPayonarrival:
        json["status_payonarrival"] == null
            ? ''
            : json["status_payonarrival"] as String,
    membershipType:
        json["membership_type"] == null
            ? ''
            : json["membership_type"] as String,
    membershipSaldo: json["membership_saldo"] as int?,
    membershipExpiryDate:
        json["membership_expiry_date"] == null
            ? ''
            : json["membership_expiry_date"] as String,
    isShowShowcase: json["is_show_showcase"] as bool?,
    isHaveTransaction: json["is_have_transaction"] as bool?,
    additionalJson:
        json["additional_json"] == null
            ? ''
            : json["additional_json"] as String,
    additionalJson2:
        json["additional_json2"] == null
            ? ''
            : json["additional_json2"] as String,
    nurturerTag:
        json["nurturer_tag"] == null ? '' : json["nurturer_tag"] as String,
    salesTag: json["sales_tag"] == null ? '' : json["sales_tag"] as String,
    salesTagAir:
        json["sales_tag_air"] == null ? '' : json["sales_tag_air"] as String,
    salesTagSea:
        json["sales_tag_sea"] == null ? '' : json["sales_tag_sea"] as String,
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "email": email,
    "phone_number": phoneNumber,
    "phone_number_2": phoneNumber2,
    "is_show_warehouse_air": isShowWarehouseAir,
    "is_show_warehouse_sea": isShowWarehouseSea,
    "avatar": avatar,
    "membership_almost_expired": membershipAlmostExpired,
    "company": company,
    "id_card_validation": idCardValidation,
    "is_allow_china": isAllowChina,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "birth_place": birthPlace,
    "birthday": birthday,
    "nationality": nationality,
    "marketer": marketer,
    "id_card_number": idCardNumber,
    "id_card_image": idCardImage,
    "id_card_name": idCardName,
    "id_card_address": idCardAddress,
    "id_card_validation_status": idCardValidationStatus,
    "status": status,
    "customer_type": customerType,
    "referral_code": referralCode,
    "is_company_customer": isCompanyCustomer,
    "is_pph_customer": isPphCustomer,
    "register_code": registerCode,
    "google_id": googleId,
    "google_link": googleLink,
    "facebook_id": facebookId,
    "facebook_link": facebookLink,
    "apple_id": appleId,
    "status_paylater": statusPaylater,
    "paylater_used": paylaterUsed,
    "paylater_limit": paylaterLimit,
    "status_payonarrival": statusPayonarrival,
    "membership_type": membershipType,
    "membership_saldo": membershipSaldo,
    "membership_expiry_date": membershipExpiryDate,
    "is_show_showcase": isShowShowcase,
    "is_have_transaction": isHaveTransaction,
    "additional_json": additionalJson,
    "additional_json2": additionalJson2,
    "nurturer_tag": nurturerTag,
    "sales_tag": salesTag,
    "sales_tag_air": salesTagAir,
    "sales_tag_sea": salesTagSea,
  };
}
