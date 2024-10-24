// custom_card.dart
import 'package:controleusuario/app/DesignSystem/Componets/ListBottons/List_buttons.dart';
import 'package:controleusuario/app/DesignSystem/Componets/ListBottons/list_buttons_view_mode.dart';
import 'package:flutter/material.dart';

import 'custom_card_view_mode.dart';

class CustomCard extends StatelessWidget {
  final CustomCardViewMode viewModel;
  final List<ListButtonsViewMode> listOptions; // Lista de opções para o menu

  const CustomCard(
      {super.key, required this.viewModel, required this.listOptions});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: viewModel.onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Foto no canto esquerdo
              CircleAvatar(
                backgroundImage: NetworkImage(viewModel.imageUrl),
                radius: 28.0,
              ),
              const SizedBox(width: 16.0), // Espaço entre a imagem e o texto
              // Título e subtítulo
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(viewModel.subtitle),
                  ],
                ),
              ),
              // Texto centralizado
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${viewModel.value.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: viewModel.onDecrease,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 8.0), // Espaço entre o texto e o botão
              // Usando a nova classe ListButtons
              ListButtons(options: listOptions),
            ],
          ),
        ),
      ),
    );
  }
}
