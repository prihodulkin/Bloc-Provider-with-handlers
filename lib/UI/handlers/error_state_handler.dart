import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/models/error_state.dart';

//обработчик ошибки
//ErrorState - интерфейс, который реализуют стейты всех блоков, сообщающие об ошибке
//Т.о., такой обработчик можно  повесить на любой блок 
class ErrorStateHandler extends Handler<ErrorState> {
  @override
  void doAction(state,context) {
    showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text(state.errorMessage),
              ));
  }
  
}
