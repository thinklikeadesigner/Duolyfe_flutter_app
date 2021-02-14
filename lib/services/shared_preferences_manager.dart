// import 'package:navigationapp/screens/home/home.dart';
// import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesManager {
// //Unique key that can be used to identify is feshly installed flag
//   static const String IS_FRESHLY_INSTALLED_PREFERENCE_KEY =
//       "is_freshly_installed";
//   Future<bool> isFreshInstalled() async {
//     var pref = await SharedPreferences.getInstance();
//     bool isFreshlyInstalled = pref.getBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY);
//     if (isFreshlyInstalled == null) {
// //null means if fresh installed and flag wasn't stored before
// //so we save false into pref incase this flag is needed again or else where after fresh installation
//       return await pref.setBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY, false);
//     } else {
//       return isFreshlyInstalled;
//     }
//   }
// }
