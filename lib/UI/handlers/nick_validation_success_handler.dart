import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/bloc/nick_handler_bloc/nick_handler_bloc.dart';

class NickValidationSuccessHandler implements Handler {
  @override
  void handle(Object? state, BuildContext context) {
    if (state is NickHandlerValidationSuccessState) {
      Navigator.of(context).pushNamed('/secondPage');
    }
  }
}
