import 'package:test_proj/business_logic/bloc/dummy_bloc/dummy_bloc.dart';
import 'package:test_proj/business_logic/bloc/nick_handler_bloc/nick_handler_bloc.dart';
import 'package:test_proj/business_logic/mappers/state_to_event_mapper.dart';

class DummyStateToNickEventMapper extends StateToEventMapper<
    DummyCallNickHandlerState, NickHandlerBloc, NickHandlerEvent> {
  @override
  NickHandlerEvent map(DummyCallNickHandlerState state) {
    return NickStateFromDummyEvent();
  }
}
