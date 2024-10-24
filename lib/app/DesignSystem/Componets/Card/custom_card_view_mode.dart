// custom_card_view_mode.dart
import 'package:flutter/material.dart';

class CustomCardViewMode {
  final String title;
  final String subtitle;
  final String imageUrl; // URL da imagem
  final Function()? onTap; // Ação ao tocar no cartão
  final double value; // Valor que será exibido no centro
  final Function()? onDecrease; // Ação do botão "-"
  final Function()? onMoreOptions; // Ação do botão "..."

  CustomCardViewMode({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.value,
    this.onTap,
    this.onDecrease,
    this.onMoreOptions,
  });
}
