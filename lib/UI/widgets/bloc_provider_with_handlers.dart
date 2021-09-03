import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/UI/handlers/handler.dart';

//служит для того, чтобы сразу "вешать" на блок обработчики
class BlocProviderWithHandlers<BlocType extends BlocBase<StateType>, StateType>
    extends StatelessWidget {
  BlocProviderWithHandlers(
      {Key? key,
      required this.create,
      required this.handlers,
      this.child,
      this.lazy})
      : super(key: key);

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
  Widget build(BuildContext context) {
    return BlocProvider<BlocType>(
      create: create,
      lazy: lazy,
      child: Builder(builder: (context) {
        return BlocListener<BlocType, StateType>(
          listener: handleState,
          child: child,
        );
      }),
    );
  }
}
