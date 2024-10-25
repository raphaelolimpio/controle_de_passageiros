import 'package:controleusuario/app/DesignSystem/Componets/Buttons/action_button.dart';
import 'package:controleusuario/app/DesignSystem/Componets/Buttons/action_button_view_mode.dart';
import 'package:controleusuario/app/DesignSystem/Componets/imagens/avatar.dart';
import 'package:controleusuario/app/DesignSystem/Componets/imagens/avatar_view_mode.dart';
import 'package:controleusuario/app/DesignSystem/Componets/input/text.dart';
import 'package:controleusuario/app/views/cadastro/cadastro_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroViewMode extends StatefulWidget {
  const CadastroViewMode({super.key});

  @override
  State<CadastroViewMode> createState() => _CadastroViewModeState();
}

class _CadastroViewModeState extends State<CadastroViewMode> {
  late CadastroView _viewModel; // Instância do ViewModel
  late ActionButtonViewMode
      _cadastroButtonViewModel; // Instância do ActionButton
  late final AvatarViewModel _AvatarViewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CadastroView(); // Inicializa o ViewModel

    //imagem do perfil
    _AvatarViewModel = AvatarViewModel(
      model: AvatarModel.large,
      addImageIcon: Icon(Icons.add_a_photo),
      allowEdit: true,
      removeImageIcon: Icon(Icons.remove_circle),
      onImageChanged: (image) {},
      getImageSource: () async {
        return ImageSource.gallery;
      },
      getPreferredCameraDevice: () async {
        return CameraDevices.rear;
      },
      onImageRemoved: () {},
    );

    //botão
    _cadastroButtonViewModel = ActionButtonViewMode(
      size: ActionButtonSize.large,
      style: ActionButtonStyle.primary,
      text: 'Cadastrar',
      onPressed: () {},
      icon: null,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //imagem
              Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  child: Avatar(viewModel: _AvatarViewModel)),

              //inputTExt
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Campo nome
                    InputText.instantiate(viewModel: _viewModel.nomeViewModel),
                    const SizedBox(height: 25.0),

                    // Campo data de nascimento
                    InputText.instantiate(
                        viewModel: _viewModel.dataNascimentoViewModel),
                    const SizedBox(height: 25.0),

                    // Campo nome da escola
                    InputText.instantiate(
                        viewModel: _viewModel.escolaViewModel),
                    const SizedBox(height: 25.0),

                    // Campo endereço
                    InputText.instantiate(
                        viewModel: _viewModel.enderecoViewModel),
                    const SizedBox(height: 25.0),

                    // Campo depósito
                    InputText.instantiate(
                        viewModel: _viewModel.depositoViewModel),
                  ],
                ),
              ),

              //buton criar conta
              Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    ActionButton.instantiate(
                        viewModel: _cadastroButtonViewModel), //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
