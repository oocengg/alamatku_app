import 'package:alamatku_app/core/services/api_client.dart';
import 'package:alamatku_app/features/address/model/models/address_model.dart';
import 'package:dio/dio.dart';

class AddressService {
  final ApiClient _apiClient = ApiClient();

  // Login API
  Future<List<AddressModel>> getAddressData(String token) async {
    List<AddressModel> addressData = [];

    try {
      final response = await _apiClient.dio.get(
        "/api/blueray/customer/address",
        options: Options(headers: {"Authorization": "Token $token"}),
      );

      // Memastikan response.data['data'] tidak null atau kosong
      if (response.data != null && response.data.isNotEmpty) {
        // Iterasi pada response.data
        for (var json in response.data) {
          addressData.add(AddressModel.fromJson(json));
        }
      }

      return addressData;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addAddressData(
    String token,
    String address,
    String addressLabel,
    String name,
    String phone,
    String email,
    double lat,
    double long,
    String addressMap,
    String npwp,
    String linkNpwp,
  ) async {
    try {
      await _apiClient.dio.post(
        '/api/blueray/customer/address',
        data: {
          "address": address,
          "address_label": addressLabel,
          "name": name,
          "phone_number": phone,
          "email": email,
          "province_id": 1,
          "district_id": 1,
          "sub_district_id": 1,
          "postal_code": "000000",
          "lat": lat,
          "long": long,
          "address_map": addressMap,
          "npwp": npwp,
          "npwp_file": linkNpwp,
        },
        options: Options(headers: {"Authorization": "Token $token"}),
      );
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteAddressData(String token, int id) async {
    try {
      await _apiClient.dio.delete(
        '/api/blueray/customer/address/delete',
        data: {"address_id": id},
        options: Options(headers: {"Authorization": "Token $token"}),
      );
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateAddressData(
    String token,
    String id,
    String address,
    String addressLabel,
    String name,
    String phone,
    String email,
    double lat,
    double long,
    String addressMap,
    String npwp,
    String linkNpwp,
  ) async {
    try {
      await _apiClient.dio.put(
        '/api/blueray/customer/address/$id',
        data: {
          "address": address,
          "address_label": addressLabel,
          "name": name,
          "phone_number": phone,
          "email": email,
          "province_id": 1,
          "district_id": 1,
          "sub_district_id": 1,
          "postal_code": "000000",
          "lat": lat,
          "long": long,
          "address_map": addressMap,
          "npwp": npwp,
          "npwp_file": linkNpwp,
        },
        options: Options(headers: {"Authorization": "Token $token"}),
      );
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
