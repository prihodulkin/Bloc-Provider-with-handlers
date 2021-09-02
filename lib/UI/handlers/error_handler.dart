import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/models/error_state.dart';

//обработчик ошибки
//ErrorState - интерфейс, который реализуют стейты всех блоков, сообщающие об ошибке
//Т.о., такой обработчик можно  повесить на любой блок 
class ErrorHandler implements Handler {
  void handle(Object? state, BuildContext context) {
    if (state is ErrorState) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text(state.errorMessage),
              ));
    }
  }
}
