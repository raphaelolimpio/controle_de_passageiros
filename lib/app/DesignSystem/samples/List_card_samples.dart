// Exemplo de uso
import 'package:controleusuario/app/DesignSystem/Componets/ListCard/list_card.dart';
import 'package:controleusuario/app/DesignSystem/Componets/ListCard/list_card_view_mode.dart';
import 'package:flutter/material.dart';

class ListCardSamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Crie uma lista de cards
    final cards = [
      ListCardViewMode(
        title: 'Card 1',
        subtitle: 'Descrição do Card 1',
        imageUrl: 'https://example.com/image1.jpg',
        value: 0.00,
        onTap: () {
          print('Card 1 tapped!');
        },
        onDecrease: () {
          print('Decrease pressed on Card 1');
        },
      ),
      ListCardViewMode(
        title: 'Card 2',
        subtitle: 'Descrição do Card 2',
        imageUrl: 'https://example.com/image2.jpg',
        value: 0.00,
        onTap: () {
          print('Card 2 tapped!');
        },
        onDecrease: () {
          print('Decrease pressed on Card 2');
        },
      ),
      // Adicione quantos cards desejar
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de List Card')),
      body: ListCard(cards: cards), // Usando ListCard aqui
    );
  }
}
