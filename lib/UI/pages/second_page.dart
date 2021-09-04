import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/UI/widgets/binded_bloc_provider.dart';
import 'package:test_proj/business_logic/bloc/dummy_bloc/dummy_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BindedBlocProvider(
      create: (context) => DummyBloc(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text('SecondPage'),
              ),
              body: Column(
                children: [
                  Center(child: Text('Success!')),
                  TextButton(
                      onPressed: () => BlocProvider.of<DummyBloc>(context)
                          .add(DummyCallNickHandlerEvent()),
                      child: Text("Click me!"))
                ],
              )),
        );
      }),
    );
  }
}
