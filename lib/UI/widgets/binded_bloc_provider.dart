import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_proj/business_logic/bloc/binding_bloc/binding_bloc.dart';

//передаёт сведения об отправленном стейте в связующий блок
class BindedBlocProvider<BlocType extends BlocBase<Object>>
    extends SingleChildStatelessWidget {
  BindedBlocProvider({Key? key, required this.create, this.child, this.lazy})
      : super(key: key, child: child);

  final BlocType Function(BuildContext context) create;
  final Widget? child;
  final bool? lazy;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<BlocType>(
      create: create,
      lazy: lazy,
      child: Builder(builder: (context) {
        BlocProvider.of<BindingBloc>(context)
            .add(BindingNewBlocEvent(BlocProvider.of<BlocType>(context)));
        return Container(
          child: child,
        );
      }),
    );
  }
}
