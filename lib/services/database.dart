import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/models/onboarding_data.dart';
import 'package:navigationapp/models/user_interests.dart';

import '../models/user_class.dart';

//TODO convert TimeOfDay to firebase's time type

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //onboardingCollection reference
  final CollectionReference onboardingCollection =
      FirebaseFirestore.instance.collection('onboarding');

//used when creating user onboarding document, and when updating the data later on
  Future updateOnboarding(
      List<dynamic> interests, bool completedOnboarding, String buddy) async {
    return await onboardingCollection.doc(uid).set({
      'interests': interests ?? ['Crafts', 'Social'],
      'completedOnboarding': completedOnboarding ?? false,
      'buddy': buddy ?? 'panda'
    });
  }

//get user collection, in a stream, using a getter, using "QuerySnapshot" which returns a snapshot of the document at that moment in time

//convert user data snapshot into user objects from user data model

  List<Onboarding> _onboardingFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Onboarding(
          interests: doc.data()['interests'] ?? [],
          completedOnboarding: doc.data()['completedOnboarding'] ?? false,
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
        completedOnboarding: snapshot.data()['completedOnboarding'] ?? false,
        buddy: snapshot.data()['buddy'] ?? '');
  }
}

// final Future<void> onboarding = FirebaseFirestore.instance
//   .collection('onboarding')
//   .doc('faiUa9JLDSXJABtt3Ao9kFws1tc2')
//   .get()
//   .then((value) => print('${value.data()['interests']}'));
