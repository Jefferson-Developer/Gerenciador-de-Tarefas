enum ProjectStatus {
  em_andamento(label: 'Em andamento'),
  finalizado(label: 'Finalidado');

  final String label;

  const ProjectStatus({required this.label});
}
