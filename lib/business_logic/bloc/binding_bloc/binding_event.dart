part of 'binding_bloc.dart';

abstract class BindingEvent extends Equatable {
  const BindingEvent();

  @override
  List<Object> get props => [];
}

class BindingNewStateEvent<BlocType extends BlocBase<StateType>, StateType>
    extends BindingEvent {
  final BlocType bloc;
  final StateType state;
  BindingNewStateEvent(this.bloc, this.state);
  @override
  List<Object> get props => [state!, bloc];
}

class BindingNewBlocEvent<BlocType extends BlocBase<Object?>>
    extends BindingEvent {
  final BlocType bloc;
  BindingNewBlocEvent(this.bloc);
  @override
  List<Object> get props => [bloc];
}
