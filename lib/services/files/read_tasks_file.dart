import 'dart:convert';
import 'package:flutter/services.dart';

class ReadTasksFile {
  final String path;
  final String tasks;

  ReadTasksFile(this.path, this.tasks);

  Future readJson() async {
    final String response = await rootBundle.loadString(path);
    final map = await json.decode(response);

    return map[tasks];
  }
}

// ReadTasksFile _readTasksFile =
//       ReadTasksFile('assets/activities.json', 'interests');

//       _readTasksFile.readJson().then((value) => print(value));
