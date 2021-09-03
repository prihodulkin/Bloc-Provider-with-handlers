import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  DummyBloc() : super(DummyInitial());

  @override
  Stream<DummyState> mapEventToState(
    DummyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
