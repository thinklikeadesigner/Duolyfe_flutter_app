// import 'package:sembast/sembast.dart';
// import 'package:sembast_tutorial/data/app_database.dart';
// import 'package:sembast_tutorial/data/time.dart';

// class TimeDao {
//   static const String TIME_STORE_NAME = 'times';
//   // A Store with int keys and Map<String, dynamic> values.
//   // This Store acts like a persistent map, values of which are Time objects converted to Map
//   final _timeStore = intMapStoreFactory.store(TIME_STORE_NAME);

//   // Private getter to shorten the amount of code needed to get the
//   // singleton instance of an opened database.
//   Future<Database> get _db async => await AppDatabase.instance.database;

//   Future insert(Time time) async {
//     await _timeStore.add(await _db, time.toMap());
//   }

//   Future update(Time time) async {
//     // For filtering by key (ID), RegEx, greater than, and many other criteria,
//     // we use a Finder.
//     final finder = Finder(filter: Filter.byKey(time.id));
//     await _timeStore.update(
//       await _db,
//       time.toMap(),
//       finder: finder,
//     );
//   }

//   Future delete(Time time) async {
//     final finder = Finder(filter: Filter.byKey(time.id));
//     await _timeStore.delete(
//       await _db,
//       finder: finder,
//     );
//   }

//   Future<List<Time>> getAllSortedByName() async {
//     // Finder object can also sort data.
//     final finder = Finder(sortOrders: [
//       SortOrder('name'),
//     ]);

//     final recordSnapshots = await _timeStore.find(
//       await _db,
//       finder: finder,
//     );

//     // Making a List<Time> out of List<RecordSnapshot>
//     return recordSnapshots.map((snapshot) {
//       final time = Time.fromMap(snapshot.value);
//       // An ID is a key of a record from the database.
//       time.id = snapshot.key;
//       return time;
//     }).toList();
//   }
// }
