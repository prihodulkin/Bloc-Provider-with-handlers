import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/business_logic/bloc/binding_bloc/binding_bloc.dart';
import 'package:test_proj/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BindingBloc(),
      child: MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.firstPage,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
