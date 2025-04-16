import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:alamatku_app/features/address/widgets/item_widget/address_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressProvider>().loadLocationAndAlamat();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    final daftarAlamat = provider.daftarAlamat;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Alamat Kamu',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_location_alt_rounded,
                      color: AppColors.primary500,
                    ),
                  ),
                ],
              ),
            ),

            // Daftar Alamat
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
                          return addressItem();
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
