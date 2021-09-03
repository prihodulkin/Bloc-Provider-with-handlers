import 'package:flutter/cupertino.dart';

//интерфейс класса обработчика: обрабатывает абстрактный объект, принимает
//также в качестве параметра контекст, чтоб сделать что-то в UI
//например, показать диалоговое окно или положить на стек новую страницу
abstract class Handler<StateType> {
  bool checkType(Object? state) {
    return state is StateType;
  }

  void doAction(StateType state, BuildContext context);

  void handle(Object? state, BuildContext context) {
    if (checkType(state)) doAction(state as StateType, context);
  }
}
