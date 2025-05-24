import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s_rocks_music/Model/model.dart';

class Repo {
  final collection = FirebaseFirestore.instance.collection('services');

  Future<List<Model>> fetchServices() async {
    final snapshot = await collection.get();
    return snapshot.docs.map((doc) => Model.fromFirestore(doc.data())).toList();
  }
}
