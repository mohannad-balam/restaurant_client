import 'package:flutter/material.dart';
import 'package:reservation_client/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final IconData? icon;
  final Color? iconColor;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool? enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.icon,
    this.iconColor = AppColors.mainColor,
    this.keyboardType,
    this.isPassword = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: isPassword,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: Icon(
          icon,
          color: iconColor,
        ),
      ),
      validator: validator,
    );
  }
}
