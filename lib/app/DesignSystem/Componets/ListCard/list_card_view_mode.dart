// list_card_view_mode.dart
import 'package:flutter/material.dart';

class ListCardViewMode {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double value; // Adicione o valor
  final Function() onTap; // Função ao tocar no card
  final Function() onDecrease; // Função para o botão de diminuir

  ListCardViewMode({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.value,
    required this.onTap,
    required this.onDecrease,
  });
}
