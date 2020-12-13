import 'package:flutter/material.dart';

import 'package:navigationapp/models/user_data.dart';
import 'user_data_tile.dart';
import 'package:provider/provider.dart';

class OnboardingList extends StatefulWidget {
  @override
  _OnboardingListState createState() => _OnboardingListState();
}

class _OnboardingListState extends State<OnboardingList> {
  @override
  Widget build(BuildContext context) {
    final onboarding = Provider.of<List<Onboarding>>
            // <QuerySnapshot>
            (context) ??
        [];

    // userData.forEach((data) {
    //   print(data.interests);
    // });

    // for (var doc in userData.docs) {
    //   print(doc.data());
    // }

    // return Container();

    return ListView.builder(
      itemCount: onboarding.length,
      itemBuilder: (context, index) {
        return OnboardingTile(onboarding: onboarding[index]);
      },
    );
  }
}
