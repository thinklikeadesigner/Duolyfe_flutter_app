import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/fruit.dart';

@immutable
abstract class FruitState extends Equatable {
  FruitState([List props = const []]) : super();
}

class FruitsLoading extends FruitState {
  List<Object> get props => [];
}

class FruitsLoaded extends FruitState {
  List<Object> get props => [fruits];
  final List<Fruit> fruits;

  FruitsLoaded(this.fruits) : super([fruits]);
}
