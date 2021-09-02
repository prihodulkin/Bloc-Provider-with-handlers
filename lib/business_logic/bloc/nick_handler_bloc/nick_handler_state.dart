part of 'nick_handler_bloc.dart';

@immutable
abstract class NickHandlerState extends Equatable {
  @override
  List<Object?> get props => [Object()];
}

class NickHandlerValidationErrorState extends NickHandlerState implements ErrorState {
  final String errorMessage;
  NickHandlerValidationErrorState(this.errorMessage);
}

class NickHandlerInitial extends NickHandlerState {}

class NickHandlerValidationSuccessState extends NickHandlerState{}
