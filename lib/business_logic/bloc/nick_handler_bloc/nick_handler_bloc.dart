import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_proj/business_logic/models/error_state.dart';

part 'nick_handler_event.dart';
part 'nick_handler_state.dart';

class NickHandlerBloc extends Bloc<NickHandlerEvent, NickHandlerState> {
  NickHandlerBloc() : super(NickHandlerInitial());

  @override
  Stream<NickHandlerState> mapEventToState(
    NickHandlerEvent event,
  ) async* {
    if (event is NickEnteredEvent) {
      var name = event.name;
      if (name.isEmpty) {
        yield NickHandlerValidationErrorState(
            "You can't enter empty nickname!");
      } else if (name.contains(RegExp(r'[\d]'))) {
        yield NickHandlerValidationErrorState(
            "You can't use digits in your nickname");
      } else {
        yield NickHandlerValidationSuccessState();
      }
    } else if (event is NickStateFromDummyEvent) {
      print("Event from Dummy BLoC was recieved!");
    }
  }
}
