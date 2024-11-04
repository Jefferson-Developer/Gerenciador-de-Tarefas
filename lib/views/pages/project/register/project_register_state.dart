import 'package:flutter/cupertino.dart';
import 'package:job_timer/controllers/models/project_model.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/project_status.dart';

class ProjectRegisterState extends ChangeNotifier {
  final ProjectServiceImpl _service;

  ProjectRegisterState({required ProjectServiceImpl state})
      : _service = state ;

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final estimateEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    estimateEC.dispose();
  }

  void save() {
    if (formKey.currentState?.validate() ?? false) {
      _service.register(ProjectModel(name: nameEC.text, status: ProjectStatus.em_andamento, estimate: int.parse(estimateEC.text)));
    }
  }
}
