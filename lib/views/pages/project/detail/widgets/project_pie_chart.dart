import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';

class ProjectPieChart extends StatelessWidget {
  final int projectEstimate;
  final int totalTasks;
  const ProjectPieChart({
    super.key,
    required this.projectEstimate,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    final residual = projectEstimate - totalTasks;  
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: [
                PieChartSectionData(
                  value: totalTasks.toDouble(),
                  color: AppColors.primaryColor,
                  showTitle: true,
                  title: '${totalTasks}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                '${projectEstimate}h',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}
