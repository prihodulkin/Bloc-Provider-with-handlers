import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/business_logic/bloc/binding_bloc/binding_bloc.dart';
import 'package:test_proj/business_logic/mappers/state_to_event_mapper.dart';

class BlocBinder extends StatelessWidget {
  BlocBinder({required this.mappers, this.child, this.key});
  final List<StateToEventMapper> mappers;
  final Widget? child;
  final Key? key;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BindingBloc(mappers),
      child: child,
      key: key,
    );
  }
}
