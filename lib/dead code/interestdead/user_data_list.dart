// import 'package:flutter/material.dart';

// import 'package:navigationapp/models/onboarding_data.dart';
// import 'package:provider/provider.dart';

// class OnboardingList extends StatefulWidget {
//   @override
//   _OnboardingListState createState() => _OnboardingListState();
// }

// class _OnboardingListState extends State<OnboardingList> {
//   @override
//   Widget build(BuildContext context) {
//     final onboarding = Provider.of<List<Onboarding>>
//             // <QuerySnapshot>
//             (context) ??
//         [];

//     return ListView.builder(
//       itemCount: onboarding.length,
//       itemBuilder: (context, index) {
//         return OnboardingTile(onboarding: onboarding[index]);
//       },
//     );
//   }
// }
