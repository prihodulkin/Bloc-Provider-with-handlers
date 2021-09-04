import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/UI/widgets/bloc_binder.dart';
import 'package:test_proj/business_logic/bloc/binding_bloc/binding_bloc.dart';
import 'package:test_proj/business_logic/mappers/dummy_state_to_nick_event_mapper.dart';
import 'package:test_proj/business_logic/mappers/nick_validation_to_dummy_fake_mapper.dart';
import 'package:test_proj/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBinder(
      mappers: [
        NickValidationToDummyFakeMapper(),
        DummyStateToNickEventMapper()
      ],
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
