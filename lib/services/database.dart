import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/user_class.dart';
import '../models/user_class.dart';

//TODO convert TimeOfDay to firebase's time type

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  static FirebaseFirestore db = FirebaseFirestore.instance;
  //onboardingCollection reference
  final CollectionReference onboardingCollection = db.collection('onboarding');

//used when creating user onboarding document, and when updating the data later on
  Future updateOnboarding(
      List<dynamic> interests, bool completedOnboarding, String buddy) async {
    return await onboardingCollection.doc(uid).set({
      'interests': interests ?? ['Crafts', 'Social'],
      'completedOnboarding': completedOnboarding ?? false,
      'buddy': buddy ?? 'panda'
    });
  }

//get user doc stream
  Stream<UserData> get userData {
    return onboardingCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

//get user collection, in a stream, using a getter, using "QuerySnapshot" which returns a snapshot of the document at that moment in time
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        interests: snapshot.data()['interests'] ?? [],
        completedOnboarding: snapshot.data()['completedOnboarding'] ?? false,
        buddy: snapshot.data()['buddy'] ?? '');
  }
}

// can be used to grab all activities that match the interest query
// Firestore also supports array queries. For example, to filter users who speak English (en) or Italian (it), use the arrayContainsAny filter:
// FirebaseFirestore.instance
//   .collection('users')
//   .where('language', arrayContainsAny: ['en', 'it'])
//   .get()
//   .then(...);
