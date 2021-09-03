part of 'binding_bloc.dart';

abstract class BindingState extends Equatable {
  const BindingState();
  
  @override
  List<Object> get props => [];
}

class BindingInitial extends BindingState {}
