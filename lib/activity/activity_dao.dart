import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/activity.dart';

class ActivityDao {
  static const String ACTIVITY_STORE_NAME = 'activities';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Activity objects converted to Map
  final _activityStore = intMapStoreFactory.store(ACTIVITY_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Activity activity) async {
    await _activityStore.add(await _db, activity.toMap());
  }

  Future update(Activity activity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(activity.id));
    await _activityStore.update(
      await _db,
      activity.toMap(),
      finder: finder,
    );
  }

  Future delete(Activity activity) async {
    final finder = Finder(filter: Filter.byKey(activity.id));
    await _activityStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Activity>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _activityStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Activity> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final activity = Activity.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      activity.id = snapshot.key;
      return activity;
    }).toList();
  }

  Future<List<Activity>> getAllCooking(String interestName) async {
    // Finder object can also sort data.
    final finder = Finder(filter: Filter.equals('interest', interestName));

    final recordSnapshots = await _activityStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Activity> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final activity = Activity.fromMap(snapshot.value);
      // An ID is a key of a record from the database.

      activity.id = snapshot.key;
      return activity;
    }).toList();
  }
}
