import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget addressItem(
  BuildContext context,
  int id,
  String label,
  String name,
  String telephone,
  String alamat,
) {
  return GestureDetector(
    onLongPress: () {
      final rootContext = context; // simpan context luar
      _showDeleteConfirmation(rootContext, id);
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dark100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 8),
                _buildItemAlamat(BootstrapIcons.person, name),
                SizedBox(height: 4),
                _buildItemAlamat(BootstrapIcons.telephone, telephone),
                SizedBox(height: 4),
                _buildItemAlamat(BootstrapIcons.map, alamat),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(BootstrapIcons.pin_map_fill, size: 18, color: AppColors.rose500),
        ],
      ),
    ),
  );
}

Row _buildItemAlamat(IconData icon, String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 16, color: AppColors.black),
      SizedBox(width: 8),
      Expanded(
        child: Text(
          title,
          style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
          maxLines: 2,
        ),
      ),
    ],
  );
}

void _showDeleteConfirmation(BuildContext rootContext, int addressId) {
  showDialog(
    context: rootContext,
    builder:
        (dialogContext) => AlertDialog(
          title: const Text('Hapus Alamat'),
          content: const Text('Apakah kamu yakin ingin menghapus alamat ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext); // tutup dialog

                try {
                  await rootContext.read<AddressProvider>().deleteAddressData(
                    addressId,
                  );

                  rootContext.read<AddressProvider>().getAddressData();

                  ScaffoldMessenger.of(rootContext).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom: 100.0,
                        left: 16,
                        right: 16,
                      ),
                      backgroundColor: AppColors.success500,
                      content: const Text('Berhasil menghapus alamat'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(rootContext).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom: 100.0,
                        left: 16,
                        right: 16,
                      ),
                      backgroundColor: AppColors.rose500,
                      content: const Text('Gagal menghapus alamat'),
                    ),
                  );
                }
              },
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}
