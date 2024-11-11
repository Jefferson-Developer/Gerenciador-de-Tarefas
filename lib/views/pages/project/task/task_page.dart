import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/views/pages/project/task/task_state.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends AppState<TaskPage, TaskState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Criar nova task',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: state.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: state.nameEC,
                  validator: Validatorless.required('Nome obrigatório'),
                  decoration: const InputDecoration(
                    labelText: 'Nome da task',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: Validatorless.multiple([
                    Validatorless.required('Duração obrigatória'),
                    Validatorless.number('Permitido somente números')
                  ]),
                  controller: state.estimateEC,
                  decoration: const InputDecoration(
                    labelText: 'Duração da task',
                  ),
                ),
                const SizedBox(height: 10),
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
                                        AppColors.primaryColor),
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
        ));
  }
}
