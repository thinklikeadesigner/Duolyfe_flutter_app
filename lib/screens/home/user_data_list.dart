import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/models/user_data.dart';
import 'user_data_tile.dart';
import 'package:provider/provider.dart';

class UserOnboardingDataList extends StatefulWidget {
  @override
  _UserOnboardingDataListState createState() => _UserOnboardingDataListState();
}

class _UserOnboardingDataListState extends State<UserOnboardingDataList> {
  @override
  Widget build(BuildContext context) {
    final userOnboardingData = Provider.of<List<UserOnboardingData>>
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
      itemCount: userOnboardingData.length,
      itemBuilder: (context, index) {
        return UserOnboardingDataTile(
            userOnboardingData: userOnboardingData[index]);
      },
    );
  }
}
