import 'package:controleusuario/app/DesignSystem/Componets/Buttons/action_button_view_mode.dart';
import 'package:controleusuario/app/DesignSystem/shared/colors.dart';
import 'package:controleusuario/app/DesignSystem/shared/styles.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewMode viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewMode viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 32;
    double verticalPadding = 12;
    double iconSize = 24;
    TextStyle buttonTextStyle = buttonSemibold;
    Color buttonColor = darkPrimaryBrandColor;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonTextStyle = buttonBold;
        iconSize = 32.0;
        break;
      case ActionButtonSize.medium:
        buttonTextStyle = buttonBold2;
        horizontalPadding = 24.0;
        iconSize = 24;
        break;
      case ActionButtonSize.small:
        buttonTextStyle = buttonBold3;
        horizontalPadding = 16;
        iconSize = 16;
        break;

      default:
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = BotonPrimaryColor;
        break;
      case ActionButtonStyle.secondary:
        buttonColor = BotonSecundaryColor;
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = BotonTertiaryColor;
        break;
      default:
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          textStyle: buttonTextStyle,
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding)),
      child: viewModel.icon != null
          ? Row(
              children: [
                Icon(
                  viewModel.icon,
                  size: iconSize,
                ),
                Text(
                  viewModel.text,
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          : Text(
              viewModel.text,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
