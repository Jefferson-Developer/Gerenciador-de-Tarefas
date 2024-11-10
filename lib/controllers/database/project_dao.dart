import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_timer/controllers/services/interfaces/firebase_database_services.dart';
import 'package:job_timer/models/constants/global_constants.dart';
import 'package:job_timer/models/constants/project_constants.dart';
import 'package:job_timer/models/entities/project.dart';
import 'package:job_timer/models/entities/project_status.dart';

class ProjectDAO extends IFirebaseDatabaseServices<Project> {
  final CollectionReference _db;

  ProjectDAO()
      : _db = FirebaseFirestore.instance
            .collection(USERS)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(ProjectConstants.FOLDER_NAME);

  @override
  Future<void> create({
    required Project data,
  }) async {
    await _db.add(data.toMap());
  }

  @override
  Future<void> delete({
    required String uid,
  }) async {
    await _db.doc(uid).delete();
  }

  @override
  Future<List<Project>> getAll() async {
    final querySnapshot = await _db.get();
    List<Project> projects = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      projects.add(Project.fromMap(
        map: doc.data() as Map<String, dynamic>,
        uid: doc.id,
      ));
    }
    return projects;
  }

  @override
  Future<void> update({
    required Project data,
  }) async {
    await _db.doc(data.uid).set(
          data.toMap(),
        );
  }

  @override
  Future<List<Project>> findByStatus(
    ProjectStatus status,
  ) async {
    final querySnapshot = await _db
        .where(
          'status',
          isEqualTo: status.index,
        )
        .get();
    List<Project> projects = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      projects.add(Project.fromMap(
        map: doc.data() as Map<String, dynamic>,
        uid: doc.id,
      ));
    }
    return projects;
  }
}
