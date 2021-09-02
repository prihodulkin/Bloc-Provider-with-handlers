import 'package:flutter/cupertino.dart';

//интерфейс класса обработчика: обрабатывает абстрактный объект, принимает
//также в качестве параметра контекст, чтоб сделать что-то в UI
//например, показать диалоговое окно или положить на стек новую страницу 
abstract class Handler {
  void handle(Object? state, BuildContext context);
}
