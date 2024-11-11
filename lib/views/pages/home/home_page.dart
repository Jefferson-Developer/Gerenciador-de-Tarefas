import 'package:flutter/material.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/views/pages/home/home_state.dart';
import 'package:job_timer/views/pages/home/widgets/header_projects_menu.dart';
import 'package:job_timer/views/pages/home/widgets/project_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AppState<HomePage, HomeState> {
  @override
  void initState() {
    super.initState();
    state.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            title: GestureDetector(
                onTap: state.signOut, child: const Text('Sair')),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.white, // Alterar a cor do ícone aqui
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(
                status: state.status,
                reload: state.getProjects,
              ),
              pinned: true,
            ),
            ValueListenableBuilder(
              valueListenable: state.isLoadingNotifier,
              builder: (context, isLoading, widget) {
                if (isLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.errorMessage != null) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.errorMessage!),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProjectTile(
                          project: state.projects[index],
                          refresh: state.getProjects,
                        );
                      },
                      childCount: state.projects.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
