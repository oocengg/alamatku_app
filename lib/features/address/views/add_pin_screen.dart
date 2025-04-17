import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';

class AddPinScreen extends StatefulWidget {
  const AddPinScreen({super.key});

  @override
  State<AddPinScreen> createState() => _AddPinScreenState();
}

class _AddPinScreenState extends State<AddPinScreen> {
  LatLng? selectedPosition;

  @override
  void initState() {
    super.initState();
    final current = context.read<AddressProvider>().currentPosition;
    if (current != null) {
      selectedPosition = LatLng(current.latitude, current.longitude);
    }
  }

  void _onTapMap(LatLng point) async {
    setState(() {
      selectedPosition = point;
    });
    context.read<AddressProvider>().setMapLocation(
      point.latitude,
      point.longitude,
    );
  }

  void _confirmLocation() {
    final provider = context.read<AddressProvider>();
    if (selectedPosition != null) {
      Navigator.pop(context, {
        'lat': selectedPosition!.latitude,
        'lng': selectedPosition!.longitude,
        'address': provider.mapAddressController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddressProvider>();
    final center =
        selectedPosition ?? const LatLng(-6.1754, 106.8272); // Default: Monas

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            BootstrapIcons.arrow_left_circle,
            color: AppColors.primary500,
          ),
        ),
        title: const Text(
          'Pilih Lokasi di Peta',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary500,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: center,
              initialZoom: 15.0,
              onTap: (tapPos, point) => _onTapMap(point),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}&s=Ga',
                subdomains: const ['a', 'b', 'c'],
              ),
              if (selectedPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 40,
                      height: 40,
                      point: selectedPosition!,
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 36,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (provider.mapAddressController.text.isNotEmpty)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  provider.mapAddressController.text,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child:
            // ElevatedButton(
            //   onPressed: _confirmLocation,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     padding: const EdgeInsets.symmetric(vertical: 14),
            //   ),
            //   child: const Text('Pilih Lokasi'),
            // ),
            AlamatkuButton(text: 'Pilih Lokasi', onPressed: _confirmLocation),
          ),
        ],
      ),
    );
  }
}
