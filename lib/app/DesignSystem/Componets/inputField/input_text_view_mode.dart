import 'package:flutter/material.dart';

class InputTextViewMode {
  final TextEditingController controller;
  final String placeholder;
  final Widget? suffixIcon;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordVisibility;

  InputTextViewMode({
    required this.controller,
    required this.placeholder,
    this.suffixIcon,
    this.isEnabled = true,
    this.validator,
    this.togglePasswordVisibility,
  });
}
