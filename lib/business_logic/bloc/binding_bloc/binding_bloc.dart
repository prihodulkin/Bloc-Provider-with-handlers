import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_proj/business_logic/mappers/state_to_event_mapper.dart';

part 'binding_event.dart';
part 'binding_state.dart';

class BindingBloc extends Bloc<BindingEvent, BindingState> {
  BindingBloc(List<StateToEventMapper> mappersList) : super(BindingInitial()) {
    for (var mapper in mappersList) {
      if (!_mappers.containsKey(mapper.stateType)) {
        _mappers[mapper.stateType] = Set<StateToEventMapper>()..add(mapper);
      } else {
        _mappers[mapper.stateType]!.add(mapper);
      }
    }
  }

  final Map<Type, Set<Bloc>?> _blocs = {};
  final Map<Object, Set<StateToEventMapper>> _mappers = {};

  void _handleNewBloc<BlocType extends Bloc>(BlocType bloc) {
    if (!_blocs.containsKey(bloc.runtimeType)) {
      _blocs[bloc.runtimeType] = Set()..add(bloc);
    } else {
      //можно добавлять разные блоки одного типа
      var setOfBlocs = _blocs[bloc.runtimeType] as Set;
      setOfBlocs.add(bloc);
    }
    _handleStates(bloc);
  }

  Future<void> _handleStates(Bloc bloc) async {
    await for (var state in bloc.stream) {
      if (_mappers.containsKey(state.runtimeType)) {
        for (var mapper
            in _mappers[state.runtimeType] as Set<StateToEventMapper>) {
          if (_blocs.containsKey(mapper.otherBlocType)) {
            for (var otherBloc in _blocs[mapper.otherBlocType]!) {
              otherBloc.add(mapper.map(state));
            }
          }
        }
      }
    }
    var setOfBlocs = _blocs[bloc.runtimeType] as Set;
    setOfBlocs.remove(bloc);
  }

  @override
  Stream<BindingState> mapEventToState(
    BindingEvent event,
  ) async* {
    if (event is BindingNewBlocEvent) {
      final bloc = event.bloc;
      if (bloc is Bloc) _handleNewBloc(bloc); //на случай попадания кубита
    }
  }
}
