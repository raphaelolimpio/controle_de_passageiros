// input/text_view_mode.dart
import 'package:flutter/material.dart';

enum InputTextType {
  text,
  date,
  decimal,
}

class InputTypeTextViewMode {
  final InputTextType type;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  InputTypeTextViewMode({
    required this.type,
    required this.hintText,
    this.controller,
    this.onChanged,
  });
}
