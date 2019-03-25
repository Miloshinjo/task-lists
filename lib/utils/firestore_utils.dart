import 'package:cloud_firestore/cloud_firestore.dart';

void addDocument(String collection, Map<String, dynamic> document,
    [String id]) {
  Firestore.instance.collection(collection).document(id).setData(document);
}

void updateArrayDocument(
  String collection,
  String id,
  Map<String, dynamic> fieldData,
) {
  Firestore.instance.collection(collection).document(id).updateData({
    'tasks': FieldValue.arrayUnion([fieldData])
  });
}

void deleteArrayDocument(
  String collection,
  String id,
  Map<String, dynamic> fieldData,
) {
  Firestore.instance.collection(collection).document(id).updateData({
    'tasks': FieldValue.arrayRemove([fieldData])
  });
}
