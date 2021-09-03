import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'binding_event.dart';
part 'binding_state.dart';

class BindingBloc extends Bloc<BindingEvent, BindingState> {
  BindingBloc() : super(BindingInitial());
  final Map blocs = {};

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
    } else {  //можно добавлять разные блоки одного типа
      var setOfBlocs = blocs[bloc.runtimeType] as Set; 
      setOfBlocs.add(bloc);
    }
  }

  @override
  Stream<BindingState> mapEventToState(
    BindingEvent event,
  ) async* {
    if (event is BindingNewBlocEvent) {
      handleNewBloc(event.bloc);
    }
  }
}
