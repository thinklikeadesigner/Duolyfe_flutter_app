import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/fruit.dart';

@immutable
abstract class FruitEvent extends Equatable {
  FruitEvent([List props = const []]) : super();
}

class LoadFruits extends FruitEvent {
  @override
  List<Object> get props => [];
}

class AddRandomFruit extends FruitEvent {
  List<Object> get props => [];
}

class UpdateWithRandomFruit extends FruitEvent {
  List<Object> get props => [updatedFruit];
  final Fruit updatedFruit;

  UpdateWithRandomFruit(this.updatedFruit) : super([updatedFruit]);
}

class DeleteFruit extends FruitEvent {
  final Fruit fruit;
  List<Object> get props => [fruit];
  DeleteFruit(this.fruit) : super([fruit]);
}
