
// import 'package:sembast/sembast.dart';

// import '../repositories/app_database.dart';
// import 'name.dart';

// //REFACTOR can you review this to see if there is extra stuff here?
// class NameDao {
//   static const String BUDDY_STORE_NAME = 'buddies';
//   final _nameStore = intMapStoreFactory.store(BUDDY_STORE_NAME);

//   Future<Database> get _db async => await AppDatabase.instance.database;

//   Future insert(Name name) async {
//     await _nameStore.add(await _db, name.toMap());
//   }

//   Future update(Name name) async {
//     final finder = Finder(filter: Filter.byKey(name.id));
//     await _nameStore.update(
//       await _db,
//       name.toMap(),
//       finder: finder,
//     );
//   }

//   Future delete(Name name) async {
//     final finder = Finder(filter: Filter.byKey(name.id));
//     await _nameStore.delete(
//       await _db,
//       finder: finder,
//     );
//   }

//   Future<List<Name>> getAllSortedByName() async {
//     final finder = Finder(sortOrders: [
//       SortOrder('name'),
//     ]);

//     final recordSnapshots = await _nameStore.find(
//       await _db,
//       finder: finder,
//     );

//     return recordSnapshots.map((snapshot) {
//       final name = Name.fromMap(snapshot.value);
//       name.id = snapshot.key;
//       return name;
//     }).toList();
//   }
// }
