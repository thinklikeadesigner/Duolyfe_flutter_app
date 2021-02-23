import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../models/user_class.dart';

class GmailAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String name;
  String email;
  String imageUrl;

  UserClass _userFromFirebaseUser(User user) {
    // print(user);
    // // added creation time to user class
    // print(user.metadata.creationTime.month);
    // // added last sign in time to user class
    // print(user.metadata.lastSignInTime);
    return user != null
        ? UserClass(uid: user.uid, creationTime: user.metadata.creationTime)
        : null;
  }

  //auth change user stream
  Stream<UserClass> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }
}

// auth service sign out signs user out, but they donn't need to choose their account.
// gmail auth service signs user out but they do need to choose an account whne signing in

// if (user != null) {
//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoURL != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoURL;

//   final User currentUser = _auth.currentUser;
//   assert(user.uid == currentUser.uid);

//   if (name.contains(" ")) {
//     name = name.substring(0, name.indexOf(" "));
//   }

//   print('signInWithGoogle succeeded: $user');

//   return '$user';

// }]

// return null;
