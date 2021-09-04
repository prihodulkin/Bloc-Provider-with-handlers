import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_proj/business_logic/mappers/state_to_event_mapper.dart';

part 'binding_event.dart';
part 'binding_state.dart';

class BindingBloc extends Bloc<BindingEvent, BindingState> {
  BindingBloc(List<StateToEventMapper> mappersList) : super(BindingInitial()) {
    for (var mapper in mappersList) {
      if (!mappers.containsKey(mapper.getStateType)) {
        mappers[mapper.getStateType] = Set<StateToEventMapper>()..add(mapper);
      } else {
        mappers[mapper.getStateType]!.add(mapper);
      }
    }
  }

  final Map blocs = {};
  final Map<Object, Set<StateToEventMapper>> mappers = {};

  ///удаляет мёртвые блоки
  void _deleteClosedBlocs(BlocBase<Object?> bloc) {
    var blocType = bloc.runtimeType;
    if (!blocs.containsKey(blocType)) return;
    var setOfBlocs = blocs[blocType] as Set;
    setOfBlocs.removeWhere((element) => (element as Bloc).isClosed);
    if (setOfBlocs.isEmpty) blocs.remove(blocType);
  }

  void handleNewBloc<BlocType extends BlocBase<Object?>>(BlocType bloc) {
    _deleteClosedBlocs(bloc);
    if (!blocs.containsKey(bloc.runtimeType)) {
      blocs[bloc.runtimeType] = Set()..add(bloc);
    } else {
      //можно добавлять разные блоки одного типа
      var setOfBlocs = blocs[bloc.runtimeType] as Set;
      setOfBlocs.add(bloc);
    }
  }

  bool _checkType<StateType>(BlocBase<Object?> bloc, StateType state) {
    return bloc is BlocBase<StateType>;
  }

  void handleNewState<StateType>(StateType state) {
    if (!(mappers[StateType] is Set<StateToEventMapper>)) return;
    for (var key in blocs.keys) {
      var bloc = key as BlocBase<Object?>;
      if (_checkType(bloc, state)) {
        for (var bloc in blocs[key]) {
          for (var mapper in (mappers[StateType] as Set<StateToEventMapper>)) {
            (bloc as Bloc).add(mapper.map(state));
          }
        }
      }
    }
  }

  @override
  Stream<BindingState> mapEventToState(
    BindingEvent event,
  ) async* {
    if (event is BindingNewBlocEvent) {
      handleNewBloc(event.bloc);
    } else if (event is BindingNewStateEvent) {
      handleNewState(event.state);
    }
  }
}
