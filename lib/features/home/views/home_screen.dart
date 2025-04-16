import 'package:alamatku_app/features/home/provider/home_provider.dart';
import 'package:alamatku_app/features/home/widgets/item_widget/alamat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().loadLocationAndAlamat();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final currentPosition = provider.currentPosition;
    final daftarAlamat = provider.daftarAlamat;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Halo, Bro 👋',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Map Container Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 400,
                  width: double.infinity,
                  child:
                      currentPosition != null
                          ? FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(
                                currentPosition.latitude,
                                currentPosition.longitude,
                              ),
                              initialZoom: 13,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c'],
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(
                                      currentPosition.latitude,
                                      currentPosition.longitude,
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Daftar Alamat
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Alamat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      // Aksi tambah alamat baru (nanti bisa diarahkan ke add address screen)
                    },
                    icon: Icon(
                      Icons.add_location_alt_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child:
                  daftarAlamat.isEmpty
                      ? Center(child: Text("Belum ada alamat"))
                      : ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                        itemCount: daftarAlamat.length,
                        itemBuilder: (context, index) {
                          // final item = daftarAlamat[index];
                          return alamatItem();
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
