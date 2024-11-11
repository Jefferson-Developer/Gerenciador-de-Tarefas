import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/views/pages/project/register/project_register_state.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({super.key});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState
    extends AppState<ProjectRegisterPage, ProjectRegisterState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Criar novo projeto',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        key: state.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: state.nameEC,
                decoration: const InputDecoration(
                  labelText: 'Nome do projeto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onChanged: (value) {},
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: Validatorless.multiple([
                  Validatorless.required('Estimativa obrigatória'),
                  Validatorless.number('Permitido somente números')
                ]),
                controller: state.estimateEC,
                decoration: const InputDecoration(
                  labelText: 'Estimativa de horas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: state.isLoadingNotifier,
                builder: (context, isLoading, widget) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : state.save,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(isLoading ? 'Salvando' : 'Salvar'),
                          if (isLoading)
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
