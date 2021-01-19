import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/models/onboarding_data.dart';

//TODO convert TimeOfDay to firebase's time type

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference onboardingCollection =
      FirebaseFirestore.instance.collection('onboarding');

  Future updateOnboarding(
      List<dynamic> interests, int time, String buddy) async {
    return await onboardingCollection
        .doc(uid)
        .set({'interests': interests, 'time': time, 'buddy': buddy});
  }

//get user collection, in a stream, using a getter, using "QuerySnapshot" which returns a snapshot of the document at that moment in time

//convert user data snapshot into user objects from user data model

  List<Onboarding> _onboardingFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Onboarding(
          interests: doc.data()['interests'] ?? [],
          time: doc.data()['time'] ?? 0,
          buddy: doc.data()['buddy'] ?? '');
    }).toList();
  }

  // userData can be named anything

  Stream<List<Onboarding>> get onboarding {
    return onboardingCollection.snapshots().map(_onboardingFromSnapshot);
  }

//get user doc stream
  Stream<UserData> get userData {
    return onboardingCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //get userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        interests: snapshot.data()['interests'] ?? [],
        time: snapshot.data()['time'] ?? 0,
        buddy: snapshot.data()['buddy'] ?? '');
  }
}
