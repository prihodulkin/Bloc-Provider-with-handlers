part of 'binding_bloc.dart';

abstract class BindingEvent extends Equatable {
  const BindingEvent();

  @override
  List<Object> get props => [];
}


class BindingNewBlocEvent<BlocType extends BlocBase<StateType>, StateType>
    extends BindingEvent {
  final BlocType bloc;
  BindingNewBlocEvent(this.bloc);
  @override
  List<Object> get props => [bloc];
}
