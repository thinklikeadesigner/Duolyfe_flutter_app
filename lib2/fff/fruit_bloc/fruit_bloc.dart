import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/fruit.dart';
import '../data/fruit_dao.dart';
import './bloc.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  FruitDao _fruitDao = FruitDao();

  FruitBloc() : super(FruitsLoading());

  // Display a loading indicator right from the start of the app
  // @override
  // FruitState get initialState => FruitsLoading();

  // This is where we place the logic.
  @override
  Stream<FruitState> mapEventToState(
    FruitEvent event,
  ) async* {
    if (event is LoadFruits) {
      // Indicating that fruits are being loaded - display progress indicator.
      yield FruitsLoading();
      print('fruits loading');
      yield* _reloadFruits();
    } else if (event is AddRandomFruit) {
      final newFruit = RandomFruitGenerator.getRandomFruit();
      newFruit.timeAssigned = DateTime.now().toString();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Fruit from the database - we aren't yielding FruitsLoading().
      await _fruitDao.insert(newFruit);
      print('get random fruit');
      yield* _reloadFruits();
    }
    // else if (event is UpdateWithRandomFruit) {
    // final newFruit = RandomFruitGenerator.getRandomFruit();
    // // Keeping the ID of the Fruit the same
    // newFruit.id = event.updatedFruit.id;
    // await _fruitDao.update(newFruit);
    // yield* _reloadFruits();
    // }
    else if (event is UpdateFruit) {
      // final newFruit = RandomFruitGenerator.getRandomFruit();
      // Keeping the ID of the Fruit the same
      event.updatedFruit.completed = !event.updatedFruit.completed;
      // newFruit.id = event.updatedFruit.id;
      event.updatedFruit.timeAssigned = DateTime.now().toString();
      await _fruitDao.update(event.updatedFruit);
      yield* _reloadFruits();
    } else if (event is DeleteFruit) {
      await _fruitDao.delete(event.fruit);
      yield* _reloadFruits();
    }
  }

  Stream<FruitState> _reloadFruits() async* {
    final fruits = await _fruitDao.getAllSortedByName();
    // Yielding a state bundled with the Fruits from the database.
    yield FruitsLoaded(fruits);
  }
}

class RandomFruitGenerator {
  static final _fruits = [
    Fruit(
        activity: 'Go for a walk',
        interest: 'health',
        icon: 0xe4f8,
        completed: false),
    Fruit(
        activity: 'Bake a cake',
        interest: 'cooking',
        icon: 0xe477,
        completed: false),
    Fruit(
        activity: 'Meditate', interest: 'mind', icon: 0xe4aa, completed: false),
    Fruit(
        activity: 'Call a friend',
        interest: 'social',
        icon: 0xe3e1,
        completed: false),
    Fruit(
        activity: 'Eat something healthy',
        interest: 'health',
        icon: 0xe4f8,
        completed: false),
    Fruit(
        activity: 'Solve a puzzle',
        interest: 'fun',
        icon: 0xe5b1,
        completed: false),
  ];

  static Fruit getRandomFruit() {
    return _fruits[Random().nextInt(_fruits.length)];
  }
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
