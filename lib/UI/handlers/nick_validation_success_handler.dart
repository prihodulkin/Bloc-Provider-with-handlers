import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/bloc/nick_handler_bloc/nick_handler_bloc.dart';

//обработчик конкретного стейта для конкретного блока
class NickValidationSuccessHandler extends Handler<NickHandlerValidationSuccessState> {
  @override
  void doAction(state, BuildContext context) {
    Navigator.of(context).pushNamed('/secondPage');
  }
}
