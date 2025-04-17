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
}
