import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

Widget alamatItem() {
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
        Icon(BootstrapIcons.pin_map_fill, size: 18, color: AppColors.rose500),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rumah',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text('Fauzi (08229121212)', style: TextStyle(fontSize: 12)),
              Text('Jl Apatu', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    ),
  );
}
