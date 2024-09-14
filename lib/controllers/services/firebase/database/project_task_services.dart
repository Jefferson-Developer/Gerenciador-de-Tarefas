import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_timer/controllers/services/interfaces/firebase_database_services.dart';
import 'package:job_timer/models/constants/global_constants.dart';
import 'package:job_timer/models/constants/project_tasks_constants.dart';
import 'package:job_timer/models/project_task.dart';

class ProjectTaskService extends IFirebaseDatabaseServices<ProjectTask> {
  final CollectionReference _db;
  final String _projectUid;
  ProjectTaskService({
    required String projectUid,
  })  : _db = FirebaseFirestore.instance
            .collection(USERS)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(ProjectTasksConstants.FOLDER_NAME),
        _projectUid = projectUid;

  @override
  Future<void> create({
    required ProjectTask data,
  }) async {
    await _db.add(data.toMap(
      projectUid: _projectUid,
    ));
  }

  @override
  Future<void> delete({
    required String uid,
  }) async {
    await _db.doc(uid).delete();
  }

  @override
  Future<List<ProjectTask>> getAll() async {
    final querySnapshot = await _db
        .where(
          ProjectTasksConstants.PROJECT_UID,
          isEqualTo: _projectUid,
        )
        .get();
    List<ProjectTask> tasks = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      tasks.add(
        ProjectTask.fromMap(
          map: doc.data() as Map<String, dynamic>,
          uid: doc.id,
        ),
      );
    }
    return tasks;
  }

  @override
  Future<void> update({
    required ProjectTask data,
  }) async {
    await _db.doc(data.uid).set(
          data.toMap(
            projectUid: _projectUid,
          ),
        );
  }
}
