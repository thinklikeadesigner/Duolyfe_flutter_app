import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/buddy.dart';

class BuddyDao {
  static const String BUDDY_STORE_NAME = 'buddies';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Buddy objects converted to Map
  final _buddyStore = intMapStoreFactory.store(BUDDY_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Buddy buddy) async {
    await _buddyStore.add(await _db, buddy.toMap());
  }

  Future update(Buddy buddy) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(buddy.id));
    await _buddyStore.update(
      await _db,
      buddy.toMap(),
      finder: finder,
    );
  }

  Future delete(Buddy buddy) async {
    final finder = Finder(filter: Filter.byKey(buddy.id));
    await _buddyStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Buddy>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _buddyStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Buddy> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final buddy = Buddy.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      buddy.id = snapshot.key;
      return buddy;
    }).toList();
  }
}
