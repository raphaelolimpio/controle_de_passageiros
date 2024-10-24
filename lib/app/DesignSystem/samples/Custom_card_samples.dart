// Exemplo de uso
import 'package:controleusuario/app/DesignSystem/Componets/Card/custom_card.dart';
import 'package:controleusuario/app/DesignSystem/Componets/Card/custom_card_view_mode.dart';
import 'package:controleusuario/app/DesignSystem/Componets/ListBottons/list_buttons_view_mode.dart';
import 'package:flutter/material.dart';

class CustomCardSamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Custom Card')),
      body: ListView(
        children: [
          CustomCard(
            viewModel: CustomCardViewMode(
              title: 'Título do Card',
              subtitle: 'Subtítulo do Card',
              imageUrl: 'https://example.com/image.jpg',
              value: 0.00,
              onTap: () {
                print('Card tapped!');
              },
              onDecrease: () {
                print('Decrease pressed');
              },
            ),
            listOptions: [
              ListButtonsViewMode(
                title: 'Opção 1',
                onPressed: () {
                  print('Opção 1 selecionada');
                },
              ),
              ListButtonsViewMode(
                title: 'Opção 2',
                onPressed: () {
                  print('Opção 2 selecionada');
                },
              ),
              // Adicione quantas opções desejar
            ],
          ),
        ],
      ),
    );
  }
}
