import 'package:alamatku_app/core/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddressProvider extends ChangeNotifier {
  Position? _currentPosition;
  List<Map<String, String>> _daftarAlamat = [];

  Position? get currentPosition => _currentPosition;
  List<Map<String, String>> get daftarAlamat => _daftarAlamat;

  Future<void> loadLocationAndAlamat() async {
    try {
      // Load alamat dari dummy data atau API
      _daftarAlamat = [
        {"label": "Rumah", "alamat": "Jl. Mawar No.1"},
        {"label": "Kantor", "alamat": "Jl. Melati No.2"},
        {"label": "Kos", "alamat": "Jl. Anggrek No.3"},
      ];

      // Get current location dari service
      _currentPosition = await LocationService().getCurrentLocation();

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error loading location and alamat: $e');
    }
  }
}
