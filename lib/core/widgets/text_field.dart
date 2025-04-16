import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class MajadigiTextField extends StatefulWidget {
  final String placeholder;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final bool obscureText;

  const MajadigiTextField({
    super.key,
    required this.placeholder,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.errorMessage,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.obscureText = false,
  });

  @override
  State<MajadigiTextField> createState() => _MajadigiTextFieldState();
}

class _MajadigiTextFieldState extends State<MajadigiTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : false,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: AppColors.dark200, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 13.5,
              horizontal: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: AppColors.dark200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: AppColors.dark200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: AppColors.primary300),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: AppColors.error500),
            ),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _isObscured
                            ? BootstrapIcons.eye_slash
                            : BootstrapIcons.eye,
                        color: Colors.grey,
                        size: 16,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                    : (widget.suffixIcon != null
                        ? IconButton(
                          icon: Icon(widget.suffixIcon, color: Colors.grey),
                          onPressed: widget.onSuffixIconTap,
                        )
                        : null),
          ),
          validator: widget.validator,
        ),
        if (widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 12),
            child: Text(
              widget.errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
