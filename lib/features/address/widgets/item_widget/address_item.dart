import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

Widget addressItem(String label, String name, String telephone, String alamat) {
  return Container(
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
