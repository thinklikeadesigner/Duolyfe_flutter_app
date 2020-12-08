import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/user_data.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');

  Future updateUserData(
      List<dynamic> interests, int time, int points, String buddy) async {
    return await userDataCollection.doc(uid).set({
      'interests': interests,
      'time': time,
      'points': points,
      'buddy': buddy
    });
  }

//get user collection, in a stream, using a getter, using "QuerySnapshot" which returns a snapshot of the document at that moment in time

// userData can be named anything

  Stream<QuerySnapshot> get userData {
    return userDataCollection.snapshots()
        // .map(_userDataFromSnapshot)
        ;
  }

//convert user data snapshot into user objects from user data model

  // List<UserData> _userDataFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return UserData(
  //         interests: doc.data()['interests'] ?? [],
  //         time: doc.data()['time'] ?? 0,
  //         points: doc.data()['points'] ?? 0,
  //         buddy: doc.data()['buddy'] ?? '');
  //   }).toList();
  // }

  // List<UserData> _userDataListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return UserData(
  //         interests: doc.data()['interests'] ?? [],
  //         time: doc.data()['time'] ?? 5,
  //         points: doc.data()['points'] ?? 100,
  //         buddy: doc.data()['buddy'] ?? 'panda');
  //   }).toList();
  // }

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //       uid: uid,
  //       interests: snapshot.data()['interests'],
  //       time: snapshot.data()['time'],
  //       points: snapshot.data()['points'],
  //       buddy: snapshot.data()['buddy']);
  // }

//get data stream
  // Stream<List<UserData>> get userData {
  //   return userDataCollection.snapshots().map(_userDataListFromSnapshot);
  // }

//interests collection
//   Stream<UserData> get userData {
//     return userDataCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
//   }
// }
}
