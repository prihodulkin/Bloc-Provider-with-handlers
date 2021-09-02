import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/UI/handlers/handler.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocType>(
      create: create,
      lazy: lazy,
      child: BlocListener<BlocType, StateType>(
        listener: (context, state) {
          for (var handler in handlers) {
            handler.handle(state, context);
          }
        },
        child: child,
      ),
    );
  }
}
