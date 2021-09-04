part of 'binding_bloc.dart';

abstract class BindingEvent extends Equatable {
  const BindingEvent();

  @override
  List<Object> get props => [];
}

class BindingNewStateEvent<StateType>
    extends BindingEvent {
  final StateType state;
  BindingNewStateEvent(this.state);
  @override
  List<Object> get props => [state!,];
}

class BindingNewBlocEvent<BlocType extends BlocBase<Object?>>
    extends BindingEvent {
  final BlocType bloc;
  BindingNewBlocEvent(this.bloc);
  @override
  List<Object> get props => [bloc];
}
