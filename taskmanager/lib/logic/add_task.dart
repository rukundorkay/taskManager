import 'package:cloud_firestore/cloud_firestore.dart';

///[tasks] holds tasks collection from database
final CollectionReference tasks =
    FirebaseFirestore.instance.collection('tasks');

///[addTask] add new task in the task manager
Future<void> addTask({
  required String taskName,
  required String startDate,
  required String endDate,
}) {
  return tasks.add({
    'name': taskName,
    'startDate': startDate,
    'endDate': endDate,

    // 'timestamp': FieldValue.serverTimestamp(),
  });
}
