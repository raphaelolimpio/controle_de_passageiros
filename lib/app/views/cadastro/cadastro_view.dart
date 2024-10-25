import 'package:controleusuario/app/DesignSystem/Componets/input/text_view_mode.dart';
import 'package:flutter/material.dart';

class CadastroView {
  // Controladores para email e senha
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _escolaController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _depositoController = TextEditingController();

  // ViewModels para os campos de texto
  late InputTypeTextViewMode nomeViewModel;
  late InputTypeTextViewMode dataNascimentoViewModel;
  late InputTypeTextViewMode escolaViewModel;
  late InputTypeTextViewMode enderecoViewModel;
  late InputTypeTextViewMode depositoViewModel;

  CadastroView() {
    // Inicializando os ViewModels com validação
    nomeViewModel = InputTypeTextViewMode(
      type: InputTextType.text,
      hintText: "Digite o nome",
      controller: _nomeController,
    );

    dataNascimentoViewModel = InputTypeTextViewMode(
      type: InputTextType.date,
      hintText: "Digite a data de Nascimento",
      controller: _dataNascimentoController,
    );

    escolaViewModel = InputTypeTextViewMode(
      type: InputTextType.text,
      hintText: "Digite o nome da Escola",
      controller: _escolaController,
    );

    enderecoViewModel = InputTypeTextViewMode(
      type: InputTextType.text,
      hintText: "Digite o Endereço",
      controller: _enderecoController,
    );

    depositoViewModel = InputTypeTextViewMode(
      type: InputTextType.decimal,
      hintText: "Valor de Deposito",
      controller: _depositoController,
    );
  }
  Widget buildCustomCheckbox({
    required bool isChecked,
    required ValueChanged<bool?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Checkbox(
            value: isChecked,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0), // Define a checkbox redonda
            ),
            onChanged: onChanged, // Passa o callback para gerenciar o estado
          ),
          GestureDetector(
            onTap: () {
              // Chama o método ao clicar no label
              // O contexto deve ser gerenciado onde o método é chamado
            },
          )
        ],
      ),
    );
  }

  // Função de login
  void Cadastro() {
    final nome = _nomeController.text;
    final dataNascimento = _dataNascimentoController.text;
    final escola = _escolaController.text;
    final endereco = _enderecoController.text;

    if (nome.isEmpty ||
        dataNascimento.isEmpty ||
        escola.isEmpty ||
        endereco.isEmpty) {
      print('Alguns dos campos obrigatorios estaõ vazios');
      return;
    }
  }

  // Método para liberar recursos
}
