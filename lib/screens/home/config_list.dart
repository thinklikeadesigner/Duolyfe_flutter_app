import 'package:flutter/material.dart';
import 'package:navigationapp/models/config.dart';
import 'package:navigationapp/screens/home/config_tile.dart';
import 'package:provider/provider.dart';

class ConfigList extends StatefulWidget {
  @override
  _ConfigListState createState() => _ConfigListState();
}

class _ConfigListState extends State<ConfigList> {
  @override
  Widget build(BuildContext context) {
    final configs = Provider.of<List<Config>>(context) ?? [];

    configs.forEach((config) {
      print(config.interests);
      print(config.points);
      print(config.time);
    });

    return ListView.builder(
      itemCount: configs.length,
      itemBuilder: (context, index) {
        return ConfigTile(config: configs[index]);
      },
    );
  }
}
