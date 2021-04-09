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
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Fruit from the database - we aren't yielding FruitsLoading().
      await _fruitDao.insert(RandomFruitGenerator.getRandomFruit());
      print('get random fruit');
      yield* _reloadFruits();
    } else if (event is UpdateWithRandomFruit) {
      final newFruit = RandomFruitGenerator.getRandomFruit();
      // Keeping the ID of the Fruit the same
      newFruit.id = event.updatedFruit.id;
      await _fruitDao.update(newFruit);
      yield* _reloadFruits();
    } else if (event is DeleteFruit) {
      await _fruitDao.delete(event.fruit);
      yield* _reloadFruits();
    }
  }

  Stream<FruitState> _reloadFruits() async* {
    final fruits = await _fruitDao.getAllSortedByName();
    // Yielding a state bundled with the Fruits from the database.
    print('relosdfgsdfgsdfgad');
    yield FruitsLoaded(fruits);
  }
}

Icon c = Icon(Icons.palette);

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
        completed: true),
    Fruit(activity: 'Meditate', interest: 'mind', icon: 59614, completed: true),
    Fruit(
        activity: 'Call a friend',
        interest: 'social',
        icon: 0xe3e1,
        completed: false),
    Fruit(
        activity: 'Eat something healthy',
        interest: 'health',
        icon: 0xe4f8,
        completed: true),
    Fruit(
        activity: 'Solve a puzzle',
        interest: 'fun',
        icon: 0xe5b1,
        completed: true),
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
