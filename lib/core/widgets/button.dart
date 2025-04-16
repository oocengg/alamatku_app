import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? outlineColor;
  final IconData? icon;
  final String? imagePath; // Tambahan: Bisa menerima path gambar lokal atau URL
  final Color textColor;
  final double padding;
  final double borderRadius;
  final double? iconSize; // Ukuran untuk ikon atau gambar

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.outlineColor,
    this.icon,
    this.imagePath,
    this.textColor = Colors.white,
    this.padding = 16.0,
    this.borderRadius = 8.0,
    this.iconSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side:
              outlineColor != null
                  ? BorderSide(color: outlineColor!)
                  : BorderSide.none,
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: iconSize, color: textColor),
            const SizedBox(width: 8),
          ] else if (imagePath != null) ...[
            Image.asset(
              imagePath!,
              height: iconSize,
              width: iconSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
