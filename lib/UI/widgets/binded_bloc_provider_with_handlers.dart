import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/bloc/binding_bloc/binding_bloc.dart';

//передаёт сведения об отправленном стейте в связующий блок
class BindedBlocProviderWithHandlers<BlocType extends BlocBase<StateType>,
    StateType> extends SingleChildStatelessWidget {
  BindedBlocProviderWithHandlers(
      {Key? key,
      required this.create,
      required this.handlers,
      this.child,
      this.lazy})
      : super(key: key, child: child);

  final BlocType Function(BuildContext context) create;
  final Widget? child;
  final bool? lazy;
  final List<Handler> handlers;

  void handleState(BuildContext context, StateType state) {
    for (var handler in handlers) {
      handler.handle(state, context);
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<BlocType>(
      create: create,
      lazy: lazy,
      child: Builder(builder: (context) {
        BlocProvider.of<BindingBloc>(context)
            .add(BindingNewBlocEvent(BlocProvider.of<BlocType>(context)));
        return BlocListener<BlocType, StateType>(
          listener: handleState,
          child: child,
        );
      }),
    );
  }
}
