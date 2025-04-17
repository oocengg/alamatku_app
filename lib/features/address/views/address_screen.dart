import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:alamatku_app/features/address/views/add_address_screen.dart';
import 'package:alamatku_app/features/address/widgets/item_widget/address_item.dart';
import 'package:flutter/cupertino.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressProvider>().loadLocationAndAlamat();
      context.read<AddressProvider>().getAddressData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, _) {
          return SafeArea(
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
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder:
                                  (BuildContext context) =>
                                      const AddAddressScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_location_alt_rounded,
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Daftar Alamat
                if (addressProvider.addressState == AppState.loading)
                  Center(child: CircularProgressIndicator())
                else if (addressProvider.addressState == AppState.failed)
                  Center(child: Text('Failed to load data.'))
                else if (addressProvider.addressState == AppState.loaded)
                  Expanded(
                    child:
                        addressProvider.addressData.isEmpty
                            ? Center(child: Text("Belum ada alamat"))
                            : ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                              itemCount: addressProvider.addressData.length,
                              itemBuilder: (context, index) {
                                final item = addressProvider.addressData[index];
                                return addressItem(
                                  context,
                                  item.addressId ?? 0,
                                  item.addressLabel,
                                  item.name,
                                  item.phoneNumber,
                                  item.address,
                                );
                              },
                            ),
                  )
                else
                  Center(child: Text('Failed')),
              ],
            ),
          );
        },
      ),
    );
  }
}
