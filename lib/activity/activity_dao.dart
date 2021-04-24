import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/activity.dart';

class ActivityDao {
  static const String ACTIVITY_STORE_NAME = 'activities';
  final _activityStore = intMapStoreFactory.store(ACTIVITY_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Activity activity) async {
    print('added to activity store');
    await _activityStore.add(await _db, activity.toMap());
  }

//NOTE i don't need to update, bc activites are added and removed in bulk, and they aren't changed here
//URGENT need to figure out how to read activities, and then put them into a different store
  Future update(Activity activity) async {
    final finder = Finder(filter: Filter.byKey(activity.id));
    await _activityStore.update(
      await _db,
      activity.toMap(),
      finder: finder,
    );
  }

  Future delete(Activity activity) async {
    final finder = Finder(filter: Filter.byKey(activity.id));
    print('deleted to activity store');
    await _activityStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Activity>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _activityStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      print(snapshot);
      final activity = Activity.fromMap(snapshot.value);
      activity.id = snapshot.key;
      return activity;
    }).toList();
  }

//test do i need this?
//COMPLETE tested
//DEAD we don't need this
  // Future getAllCooking(String interestName) async {
  //   final finder = Finder(filter: Filter.equals('interest', interestName));

  //   final recordSnapshots = await _activityStore.find(
  //     await _db,
  //     finder: finder,
  //   );

  //   // Delete all matching List<RecordSnapshot>
  //   return recordSnapshots.map((snapshot) async {
  //     final activity = Activity.fromMap(snapshot.value);
  //     activity.id = snapshot.key;
  //     print(activity);
  //     return await delete(activity);
  //   }).toList();
  // }
}
