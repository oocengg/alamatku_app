import 'dart:io';
import 'dart:convert';

import 'package:alamatku_app/core/services/location_services.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/address/model/models/address_model.dart';
import 'package:alamatku_app/features/address/model/services/address_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider extends ChangeNotifier {
  // Controllers
  final labelController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final kotkecController = TextEditingController();
  final postalCodeController = TextEditingController();
  final mapDetailController = TextEditingController();
  final mapAddressController = TextEditingController();
  final npwpController = TextEditingController();

  double? latMap;
  double? longMap;

  // Location
  Position? currentPosition;
  double? lat;
  double? long;

  // Dropdowns
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;

  List<Map<String, dynamic>> provinceList = [];
  List<Map<String, dynamic>> districtList = [];
  List<Map<String, dynamic>> subDistrictList = [];

  // NPWP file
  File? npwpFile;
  String? npwpFileLink;

  Future<void> loadLocationAndAlamat() async {
    currentPosition = await LocationService().getCurrentLocation();
    lat = currentPosition?.latitude;
    long = currentPosition?.longitude;
    await reverseGeocode();
    notifyListeners();
  }

  void setMapLocation(double newLat, double newLong) async {
    lat = newLat;
    long = newLong;
    await reverseGeocode();
    notifyListeners();
  }

  Future<void> reverseGeocode() async {
    if (lat == null || long == null) return;
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$long',
    );
    try {
      final res = await http.get(url);
      final data = json.decode(res.body);
      mapAddressController.text = data['display_name'] ?? '';
      latMap = lat;
      longMap = long;
    } catch (e) {
      debugPrint('Error reverse geocoding: $e');
    }
  }

  // Upload NPWP
  Future<void> pickNpwpFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.single.path != null) {
      npwpFile = File(result.files.single.path!);
      await uploadNpwpFile(npwpFile!);
    }
  }

  Future<void> uploadNpwpFile(File file) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.example.com/upload'),
      );
      request.files.add(
        await http.MultipartFile.fromPath('npwp_file', file.path),
      );
      final response = await request.send();
      final resBody = await response.stream.bytesToString();
      final data = json.decode(resBody);
      npwpFileLink = data['file_url'];
      notifyListeners();
    } catch (e) {
      debugPrint('Upload NPWP error: $e');
    }
  }

  @override
  void dispose() {
    labelController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    postalCodeController.dispose();
    mapAddressController.dispose();
    npwpController.dispose();
    super.dispose();
  }

  void clearControllers() {
    labelController.clear();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    kotkecController.clear();
    postalCodeController.clear();
    mapDetailController.clear();
    mapAddressController.clear();
    npwpController.clear();
    npwpFileLink = null;
  }

  // API Intg
  final AddressService _addressService = AddressService();

  // State
  AppState addressState = AppState.loading;
  AppState addAddressState = AppState.initial;
  List<AddressModel> addressData = [];

  Future<void> getAddressData() async {
    addressState = AppState.loading;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") ?? '';

    try {
      addressData = await _addressService.getAddressData(token);

      addressState = AppState.loaded;
      notifyListeners();
    } catch (e) {
      addressState = AppState.failed;
      notifyListeners();
    }
  }

  Future<void> addAddressData(
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
    addAddressState = AppState.loading;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") ?? '';

    // Print data sebelum dikirim ke API
    print('Mengirim data ke API:');
    print('Token: $token');
    print('Address: $address');
    print('Address Label: $addressLabel');
    print('Name: $name');
    print('Phone: $phone');
    print('Email: $email');
    print('Latitude: $lat');
    print('Longitude: $long');
    print('Address Map: $addressMap');
    print('NPWP: $npwp');
    print('Link NPWP File: $linkNpwp');

    try {
      await _addressService.addAddressData(
        token,
        address,
        addressLabel,
        name,
        phone,
        email,
        lat,
        long,
        addressMap,
        npwp,
        linkNpwp,
      );

      addAddressState = AppState.loaded;
    } catch (e) {
      print(e.toString());
      addAddressState = AppState.failed;
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
