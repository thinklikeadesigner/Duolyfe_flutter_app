import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/buddy.dart';

//REFACTOR can you review this to see if there is extra stuff here?
class BuddyDao {
  static const String BUDDY_STORE_NAME = 'buddies';
  final _buddyStore = intMapStoreFactory.store(BUDDY_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Buddy buddy) async {
    await _buddyStore.add(await _db, buddy.toMap());
  }

  Future update(Buddy buddy) async {
    final finder = Finder(filter: Filter.byKey(buddy.id));
    await _buddyStore.update(
      await _db,
      buddy.toMap(),
      finder: finder,
    );
  }

Future updateOrInsert(Buddy buddy) async {

  await _buddyStore.record(buddy.id).put(await _db, buddy.toMap(), merge: false);
}

  Future delete(Buddy buddy) async {
    final finder = Finder(filter: Filter.byKey(buddy.id));
    await _buddyStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Buddy>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _buddyStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final buddy = Buddy.fromMap(snapshot.value);
      buddy.id = snapshot.key;
      return buddy;
    }).toList();
  }
}
