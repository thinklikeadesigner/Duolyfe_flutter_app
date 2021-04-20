import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/task.dart';

class TaskDao {
  static const String TASK_STORE_NAME = 'tasks';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Task objects converted to Map
  final _taskStore = intMapStoreFactory.store(TASK_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Task task) async {
    await _taskStore.add(await _db, task.toMap());
  }

  Future update(Task task) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.update(
      await _db,
      task.toMap(),
      finder: finder,
    );
  }

  Future delete(Task task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Task>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('timeAssigned'),
    ]);

    final recordSnapshots = await _taskStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Task> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final task = Task.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      task.id = snapshot.key;
      return task;
    }).toList();
  }
}
