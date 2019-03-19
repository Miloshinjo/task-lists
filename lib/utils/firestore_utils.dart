import 'package:cloud_firestore/cloud_firestore.dart';

void addDocument(String collection, Map<String, dynamic> document,
    [String id]) {
  Firestore.instance.collection(collection).document(id).setData(document);
}
