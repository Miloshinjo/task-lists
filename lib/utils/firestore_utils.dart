import 'package:cloud_firestore/cloud_firestore.dart';

void addDocument(Map<String, dynamic> document, [String id]) {
  Firestore.instance.collection('task-lists').document(id).setData(document);
}

void updateTaskDocument(
  String listId,
  Map<String, dynamic> fieldData,
) {
  Firestore.instance.collection('task-lists').document(listId).updateData({
    'tasks': FieldValue.arrayUnion([fieldData]),
  });
}

void toggleTaskCompleted(String listId, String taskId) async {
  DocumentSnapshot list =
      await Firestore.instance.collection('task-lists').document(listId).get();

  List<dynamic> currentTasks = list['tasks'];
  List<dynamic> updatedTasks = currentTasks.map((task) {
    if (task['id'] == taskId) {
      return {
        'id': task['id'],
        'body': task['body'],
        'completed': !task['completed'],
      };
    } else
      return task;
  }).toList();

  Firestore.instance
      .collection('task-lists')
      .document(listId)
      .updateData({'tasks': updatedTasks});
}

// static void updateDocument(
//     String collection, String id, Map<String, dynamic> fieldData) {
//   Firestore.instance
//       .collection(collection)
//       .document(id)
//       .setData(fieldData, merge: true);
// }

void deleteTaskDocument(
  String listId,
  Map<String, dynamic> fieldData,
) {
  Firestore.instance.collection('task-lists').document(listId).updateData({
    'tasks': FieldValue.arrayRemove([fieldData])
  });
}
