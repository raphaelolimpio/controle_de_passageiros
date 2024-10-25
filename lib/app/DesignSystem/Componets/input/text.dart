// input/text.dart
import 'package:flutter/material.dart';
import 'text_view_mode.dart';
import 'package:intl/intl.dart';

class InputText extends StatelessWidget {
  final InputTypeTextViewMode viewModel;

  const InputText({super.key, required this.viewModel});

  // Método estático de fábrica para facilitar a criação de instâncias de InputText
  static InputText instantiate({required InputTypeTextViewMode viewModel}) {
    return InputText(viewModel: viewModel);
  }

  String _getExampleText() {
    // Define o texto de exemplo conforme o tipo
    switch (viewModel.type) {
      case InputTextType.text:
        return 'Ex: abcd';
      case InputTextType.date:
        return 'dd/mm/aaaa';
      case InputTextType.decimal:
        return '0,00';
    }
  }

  String _formatDecimal(String value) {
    // Formata o valor decimal com duas casas decimais
    double? parsedValue = double.tryParse(value.replaceAll(',', '.'));
    if (parsedValue != null) {
      final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
      return formatter.format(parsedValue).replaceAll('.', ',');
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    String? Function(String?)? validator;
    String? suffixText;
    String exampleText = _getExampleText();

    switch (viewModel.type) {
      case InputTextType.text:
        keyboardType = TextInputType.text;
        break;
      case InputTextType.date:
        keyboardType = TextInputType.datetime;
        validator = (value) {
          if (value == null || value.isEmpty)
            return 'Por favor, insira uma data';
          return RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)
              ? null
              : 'Data inválida (use dd/mm/aaaa)';
        };
        break;
      case InputTextType.decimal:
        keyboardType = const TextInputType.numberWithOptions(decimal: true);
        suffixText = 'R\$';
        validator = (value) {
          if (value == null || value.isEmpty)
            return 'Por favor, insira um valor';
          return double.tryParse(value.replaceAll(',', '.')) != null
              ? null
              : 'Número inválido';
        };
        break;
    }

    return TextFormField(
      controller: viewModel.controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: viewModel.hintText,
        hintText: exampleText,
        suffixText: suffixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        viewModel.onChanged?.call(value);
        if (viewModel.type == InputTextType.decimal) {
          viewModel.controller?.value = TextEditingValue(
            text: _formatDecimal(value),
            selection: TextSelection.collapsed(offset: value.length),
          );
        }
      },
      validator: validator,
      onTap: viewModel.type == InputTextType.date
          ? () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                viewModel.controller?.text =
                    DateFormat('dd/MM/yyyy').format(date);
              }
            }
          : null,
    );
  }
}
