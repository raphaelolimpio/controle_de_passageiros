import 'package:flutter/material.dart';

class InputTextViewMode {
  final TextEditingController controller;
  final String placeholder;
  bool password;
  final Widget? suffixIcon;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordVisibility;

  InputTextViewMode({
    required this.controller,
    required this.placeholder,
    required this.password,
    this.suffixIcon,
    this.isEnabled = true,
    this.validator,
    this.togglePasswordVisibility,
  });
}