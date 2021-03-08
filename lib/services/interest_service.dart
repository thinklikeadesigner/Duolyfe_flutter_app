import 'package:cloud_firestore/cloud_firestore.dart';

class InternetService {
  getFirstInterest(String firstInterest) {
    return FirebaseFirestore.instance
        .collection('PublicData')
        .where('firstInterest', isEqualTo: firstInterest)
        .get();
  }
}
