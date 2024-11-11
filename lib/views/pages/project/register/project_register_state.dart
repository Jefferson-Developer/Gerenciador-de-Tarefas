import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/entities/project_status.dart';

class ProjectRegisterState extends ChangeNotifier {
  final ProjectServiceImpl _service;

  ProjectRegisterState({required ProjectServiceImpl state}) : _service = state;

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final estimateEC = TextEditingController();
  final isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    estimateEC.dispose();
  }

  Future<void> save() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoadingNotifier.value = true;
        await _service.register(
          ProjectModel(
            name: nameEC.text,
            status: ProjectStatus.em_andamento,
            estimate: int.parse(estimateEC.text),
          ),
        );
        AsukaSnackbar.success('Projeto salvo com sucesso!').show();
        log('Projeto salvo com sucesso');
        Modular.to.pop(true);
      } catch (error, stackTrace) {
        log('Erro ao salvar', error: error, stackTrace: stackTrace);
        AsukaSnackbar.alert('Ocorreu um erro salvar').show();
      } finally {
        isLoadingNotifier.value = false;
      }
    }
  }
}
