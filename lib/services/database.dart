import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/preferences.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference preferencesCollection =
      FirebaseFirestore.instance.collection('references');

  Future updateUserData(List<Interest> interests, int time, int points) async {
    return await preferencesCollection
        .doc(uid)
        .set({'interests': interests, 'Time': time, 'points': points});
  }
}
