import 'package:equatable/equatable.dart';

abstract class StateToEventMapper<StateType, EventType> extends Equatable{
  Type get getStateType => StateType;
  Type get getEventType => EventType;
  EventType map(StateType state);

  @override
  List<Object?> get props => [getEventType,getStateType];
}
