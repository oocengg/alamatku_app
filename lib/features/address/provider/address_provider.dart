import 'dart:io';
import 'dart:convert';

import 'package:alamatku_app/core/services/location_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

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

  // Submit Address (dummy logic)
  void submitAddress() {
    debugPrint('Label: ${labelController.text}');
    debugPrint('Name: ${nameController.text}');
    debugPrint('Phone: ${phoneController.text}');
    debugPrint('Email: ${emailController.text}');
    debugPrint('Province: $selectedProvince');
    debugPrint('District: $selectedDistrict');
    debugPrint('Sub-district: $selectedSubDistrict');
    debugPrint('Postal code: ${postalCodeController.text}');
    debugPrint('Map address: ${mapAddressController.text}');
    debugPrint('NPWP link: $npwpFileLink');
    // Implement API POST here...
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
}
