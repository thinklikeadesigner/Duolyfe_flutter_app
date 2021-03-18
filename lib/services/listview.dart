import 'package:cloud_firestore/cloud_firestore.dart';

class Cooking {
  final Future<void> publicDataCollection = FirebaseFirestore.instance
      .collection('PublicData')
      .doc('Interests')
      .get()
      .then((value) => value.data()['Cooking'][3]);
}

class Mind {
  final Future<void> publicDataCollection = FirebaseFirestore.instance
      .collection('PublicData')
      .doc('Interests')
      .get()
      .then((value) => print('activity: ${value.data()['Mind'][3]}'));
}

class Fun {
  final Future<void> publicDataCollection = FirebaseFirestore.instance
      .collection('PublicData')
      .doc('Interests')
      .get()
      .then((value) => print('activity: ${value.data()['Fun'][4]}'));
}

class User {
  final Future<void> onboarding = FirebaseFirestore.instance
      .collection('onboarding')
      .doc('faiUa9JLDSXJABtt3Ao9kFws1tc2')
      .get()
      .then((value) => print('${value.data()['interests']}'));
}
