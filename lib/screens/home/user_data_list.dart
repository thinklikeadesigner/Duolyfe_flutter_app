import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/models/user_data.dart';
import 'user_data_tile.dart';
import 'package:provider/provider.dart';

class UserDataList extends StatefulWidget {
  @override
  _UserDataListState createState() => _UserDataListState();
}

class _UserDataListState extends State<UserDataList> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<List<UserData>>
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
      itemCount: userData.length,
      itemBuilder: (context, index) {
        return UserDataTile(userData: userData[index]);
      },
    );
  }
}
