part of 'nick_handler_bloc.dart';

@immutable
abstract class NickHandlerEvent extends Equatable {
  @override
  List<Object?> get props => [Object()];
}

class NickEnteredEvent extends NickHandlerEvent {
  final String name;
  NickEnteredEvent(this.name);

}
