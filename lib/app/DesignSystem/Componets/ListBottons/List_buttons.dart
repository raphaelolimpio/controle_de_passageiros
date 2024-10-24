// list_buttons.dart

import 'package:controleusuario/app/DesignSystem/Componets/ListBottons/list_buttons_view_mode.dart';
import 'package:flutter/material.dart';

class ListButtons extends StatelessWidget {
  final List<ListButtonsViewMode> options; // Lista de opções

  const ListButtons({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ListButtonsViewMode>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return options.map((ListButtonsViewMode option) {
          return PopupMenuItem<ListButtonsViewMode>(
            value: option,
            child: Text(option.title),
          );
        }).toList();
      },
      onSelected: (ListButtonsViewMode option) {
        option.onPressed(); // Chama a ação correspondente ao botão selecionado
      },
    );
  }
}
