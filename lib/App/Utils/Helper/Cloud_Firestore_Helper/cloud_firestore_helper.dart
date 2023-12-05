import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreHelper {
  CloudFirestoreHelper._();

  static final CloudFirestoreHelper cloudFirestoreHelper =
      CloudFirestoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser({required Map<String, dynamic> data}) async {
    await firestore.collection("Student").doc("${data['Id']}").set(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> FetchUser() {
    return firestore.collection("Student").snapshots();
  }
}
