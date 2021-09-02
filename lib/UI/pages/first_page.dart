import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/UI/handlers/error_handler.dart';
import 'package:test_proj/UI/handlers/nick_validation_success_handler.dart';
import 'package:test_proj/UI/widgets/bloc_provider_with_handlers.dart';
import 'package:test_proj/business_logic/bloc/nick_handler_bloc/nick_handler_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProviderWithHandlers<NickHandlerBloc, NickHandlerState>(
        create: (context) => NickHandlerBloc(),
        handlers: [ErrorHandler(), NickValidationSuccessHandler()],
        child: Scaffold(
          appBar: AppBar(
            title: Text('FirstPage'),
          ),
          body: Center(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Please, enter your nickname. Don\'t use digits!'),
              onFieldSubmitted: (name) =>
                  BlocProvider.of<NickHandlerBloc>(context)
                      .add(NickEnteredEvent(name)),
            ),
          ),
        ),
      ),
    );
  }
}
