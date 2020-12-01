import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/config.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference configCollection =
      FirebaseFirestore.instance.collection('references');

  Future updateUserData(List<dynamic> interests, int time, int points) async {
    return await configCollection
        .doc(uid)
        .set({'interests': interests, 'time': time, 'points': points});
  }

  List<Config> _configListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Config(
          interests: doc.data()['interests'] ?? [],
          time: doc.data()['time'] ?? 5,
          points: doc.data()['points'] ?? 50);
    }).toList();
  }

//get configs stream
  Stream<List<Config>> get configs {
    return configCollection.snapshots().map(_configListFromSnapshot);
  }
}
