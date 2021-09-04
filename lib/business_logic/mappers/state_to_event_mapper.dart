import 'package:equatable/equatable.dart';

abstract class StateToEventMapper<StateType, OtherBlocType, OtherEventType>
    extends Equatable {
  Type get stateType => StateType;
  Type get otherEventType => OtherEventType;
  Type get otherBlocType => OtherBlocType;
  OtherEventType map(StateType state);

  @override
  List<Object?> get props => [otherEventType, stateType, otherBlocType];
}
