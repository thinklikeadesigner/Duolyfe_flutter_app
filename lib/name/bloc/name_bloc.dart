// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import '../name_dao.dart';
// import 'name_event.dart';
// import 'name_state.dart';
// import 'name_services.dart';

// //QUESTION does the name need a time???
// //IDEA, this can be where we can store the notification time
// //MAKEME we also need to store points and treats in here somewhere
// //UNPLUGGED this needs to be added to or replace the choosename page

// class NameBloc extends Bloc<NameEvent, NameState> {
//   NameDao _nameDao = NameDao();

//   NameBloc() : super(NamesLoading());


//   @override
//   Stream<NameState> mapEventToState(
//     NameEvent event,
//   ) async* {
//     if (event is LoadNames) {
//       yield NamesLoading();
//       print('names loading');
//       yield* _reloadNames();
//     } else if (event is ShowName) {
//       yield NamesLoading();
//       print('names loading');
//       yield* _loadName();
//     } else if (event is AddName) {
//       yield* _filterNamesByNameAndAdd(event.selectedName);

//     } 
//     else if (event is RemoveName) {

    
//       print(event.deselectedName);


//       yield* _filterActivitiesAndRemove(event.deselectedName);
//     } 
//     // else if (event is DeleteName) {
//     //   event.unSelectedName.selected = false;
//     //   await _nameDao.delete(event.unSelectedName);
//     //   yield* _reloadNames();
//     // }
//   }

//   Stream<NameState> _reloadNames() async* {
//     final names = await _nameDao.getAllSortedByName();
//     // Yielding a state bundled with the Names from the database.
//     yield NamesLoaded(names);
//   }

//   Stream<NameState> _filterNamesByNameAndAdd(String name) async* {
//     final initialNames = NamePopulator.getFilteredNames(name);
//     print(initialNames);
// //REFACTOR can i use yield* here?
//     initialNames.forEach((element) async {
//       // element.selected = true;
//       await _nameDao.insert(element);
//     });
//     yield NamesLoaded(initialNames);
//   }


// //QUESTION is this one just for testing? what is this?
//   Stream<NameState> _loadName() async* {
//     final names = await _nameDao.getAllSortedByName();
//     // Yielding a state bundled with the Names from the database.
//     yield NameLoaded(names[0]);
//   }



//   Stream<NameState> _filterActivitiesAndRemove(String name) async* {

//     List _activitiesToDelete;
//     final initialNames = await _nameDao.getAllSortedByName();
//     _activitiesToDelete = initialNames
//         .where((element) => element.name.contains(name))
//         .toList();
//     print(_activitiesToDelete);

//     _activitiesToDelete.forEach((element) async {
//       print(element);
//       await _nameDao.delete(element);
//     });
//     yield NamesDeleted();
//   }
// }






//       // } else if (event is UpdateWithRandomName) {
//       //   final newName = NamePopulator.getRandomName();
//       //   // Keeping the ID of the Name the same
//       //   newName.id = event.updatedName.id;
//       //   await _nameDao.update(newName);
//       //   yield* _reloadNames();
//       // }
//       // //
//       // else if (event is SetName) {
//       //   final names = await _nameDao.getAllSortedByName();

//       //   if (names != null) {
//       //     _filterNamesByNameAndUpdate(event.chosenName);
//       //     print('names != null');
//       //   } else {
//       //     print(' null');
//       //     // yield* _filterNamesByNameAndAdd(event.chosenName);
//       //   }
//       // yield* _reloadNames();



//       //   Stream<NameState> _filterNamesByNameAndUpdate(String name) async* {
// //     print(' _filterNamesByNameAndUpdate');
// //     final initialNames = NamePopulator.getFilteredNames(name);
// //     print(initialNames);
// //     final names = await _nameDao.getAllSortedByName();
// // //REFACTOR can i use yield* here?
// //     print(names[0]);
// //     // initialNames.forEach((element) async {
// //     //   element.id = names[0].id;
// //     //   await _nameDao.update(element);
// //     // });
// //     yield NamesLoaded(initialNames);
// //   }
