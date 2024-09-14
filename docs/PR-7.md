
# Descrição do Pull Request: Entidades do Contador de Tarefas

Desenvolvidas as classes ou estruturas necessárias para representar e manipular as informações relacionadas ao contador de tarefas no contexto do projeto.

## Explicação das Classes

### Project

A classe `Project` representa um projeto no sistema e contém os seguintes atributos:

- **uid** (opcional): Identificador único do projeto.
- **name**: Nome do projeto.
- **status**: Estado atual do projeto, representado pela enumeração `ProjectStatus`.
- **tasks**: Lista de tarefas (`ProjectTask`) associadas ao projeto.

Essa classe utiliza o pacote `equatable` para facilitar a comparação entre instâncias. O método `props` define os atributos que devem ser comparados.

### ProjectStatus

A enumeração `ProjectStatus` define dois estados possíveis para um projeto:

- **em_andamento**: Indica que o projeto está em andamento, com a etiqueta "Em andamento".
- **finalizado**: Indica que o projeto foi finalizado, com a etiqueta "Finalizado".

Cada status tem uma `label`, que é a descrição exibida ao usuário.

### ProjectTask

A classe `ProjectTask` representa uma tarefa associada a um projeto. Contém os seguintes atributos:

- **name**: Nome da tarefa.
- **duration**: Duração da tarefa em minutos.
- **created**: Data e hora em que a tarefa foi criada.

Assim como a classe `Project`, `ProjectTask` também usa o pacote `equatable` para facilitar a comparação entre objetos.

## Estrutura das Classes

```dart
import 'package:equatable/equatable.dart';
import 'package:job_timer/models/project_status.dart';
import 'package:job_timer/models/project_task.dart';

class Project extends Equatable {
  final String? uid;
  final String name;
  final ProjectStatus status;
  final List<ProjectTask> tasks;

  const Project({
    this.uid,
    required this.name,
    required this.status,
    required this.tasks,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        status,
        tasks,
      ];
}

enum ProjectStatus {
  em_andamento(label: 'Em andamento'),
  finalizado(label: 'Finalizado');

  final String label;

  const ProjectStatus({required this.label});
}

class ProjectTask extends Equatable {
  final String name;
  final int duration;
  final DateTime created;

  const ProjectTask({
    required this.name,
    required this.duration,
    required this.created,
  });

  @override
  List<Object?> get props => [
    name,
    duration,
    created,
  ];
}
```
