// list_card.dart
import 'package:controleusuario/app/DesignSystem/Componets/Card/custom_card.dart';
import 'package:controleusuario/app/DesignSystem/Componets/Card/custom_card_view_mode.dart';
import 'package:flutter/material.dart';
import 'list_card_view_mode.dart';

class ListCard extends StatelessWidget {
  final List<ListCardViewMode> cards; // Lista de cards

  const ListCard({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index]; // Pega o card atual
        return CustomCard(
          viewModel: CustomCardViewMode(
            title: card.title,
            subtitle: card.subtitle,
            imageUrl: card.imageUrl,
            value: card.value,
            onTap: card.onTap, // Função para o toque no card
            onDecrease: card.onDecrease, // Função para o botão de diminuir
          ),
          listOptions: [
            // Defina as opções do ListButtons aqui, se necessário
          ],
        );
      },
    );
  }
}
