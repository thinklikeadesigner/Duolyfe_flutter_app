import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/services/database.dart';

//TODO not on signout, not switching to sign in screen without hot restart

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //return user object based on firebase user
  UserClass _userFromFirebaseUser(User user) {
    print(user);
    // added creation time to user class
    print(user.metadata.creationTime.month);
    // added last sign in time to user class
    print(user.metadata.lastSignInTime);
    return user != null
        ? UserClass(uid: user.uid, creationTime: user.metadata.creationTime)
        : null;
  }

  //auth change user stream
  Stream<UserClass> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

//sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;

      return user;
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

//create a new document for the user with the uid

// Database service takes the result.user which is set to user, extracts the uid, and sets the property uid to user.uid
      await DatabaseService(uid: user.uid)
          .updateUserData(['Crafts', 'Social'], 5, 100, 'panda');

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return null;
    }
  }

//signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
