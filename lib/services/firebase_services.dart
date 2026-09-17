import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_space/models/task_data_model.dart';

class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createTask(TaskDataModel task) async {
    final docRef = firestore
        .collection('tasks')
        .withConverter<TaskDataModel>(
      fromFirestore: (snapshot, options) {
        return TaskDataModel.fromJson(snapshot.data()!);},
      toFirestore: (value, options) {
        return value.toFirestore();
      },)
        .doc();
    task.id = docRef.id;
    await docRef.set(task);
  }
  Stream<List<TaskDataModel>> getTasks() {
    return firestore
        .collection('tasks')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TaskDataModel.fromJson(doc.data()))
          .toList();
    });
  }
Future<void> updateTask(TaskDataModel task) async {
  if (task.id == null) {
    throw Exception('Task id is null');
  }
  await firestore
      .collection('tasks')
      .doc(task.id)
      .update(task.toFirestore());
}
Future<void> deleteTask(String taskId) async {
  await firestore
      .collection('tasks')
      .doc(taskId)
      .delete();
}
}

