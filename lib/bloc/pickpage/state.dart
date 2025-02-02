import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PickPageState extends Equatable {
  const PickPageState();
}

class Uninitialized extends PickPageState {
  @override
  List<Object> get props => null;
}

class PickedItemState extends PickPageState {
  final String pick;
  PickedItemState({@required this.pick});

  @override
  List<Object> get props => [this.pick];

  @override
  String toString() => '[State] PickPageState: PickedItemState ${this.pick}';
}

class TooFewItemsState extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: TooFewItemsState';
}

class TooManyToggledState extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: TooManyToggledState';
}

class Saving extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: Saving';
}

class Saved extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: Saved';
}
