part of 'dummy_bloc.dart';

abstract class DummyState extends Equatable {
  const DummyState();
  
  @override
  List<Object> get props => [];
}

class DummyInitial extends DummyState {}
