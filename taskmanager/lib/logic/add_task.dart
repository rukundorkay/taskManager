import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
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
