import 'package:sembast/sembast.dart';

import '../repositories/app_database.dart';
import 'models/interest.dart';

class InterestDao {
  static const String INTEREST_STORE_NAME = 'interests';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Interest objects converted to Map
  final _interestStore = intMapStoreFactory.store(INTEREST_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Interest interest) async {
    await _interestStore.add(await _db, interest.toMap());
  }

  Future update(Interest interest) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(interest.id));
    await _interestStore.update(
      await _db,
      interest.toMap(),
      finder: finder,
    );
  }

  Future delete(Interest interest) async {
    final finder = Finder(filter: Filter.byKey(interest.id));
    await _interestStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Interest>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _interestStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Interest> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final interest = Interest.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      interest.id = snapshot.key;
      return interest;
    }).toList();
  }
}
