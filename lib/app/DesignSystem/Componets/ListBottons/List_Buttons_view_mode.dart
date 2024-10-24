// list_buttons_view_mode.dart
import 'package:flutter/material.dart';

class ListButtonsViewMode {
  final String title; // Título do botão
  final Function() onPressed; // Ação a ser realizada ao pressionar o botão

  ListButtonsViewMode({
    required this.title,
    required this.onPressed,
  });
}
