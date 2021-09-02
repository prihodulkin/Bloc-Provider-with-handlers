import 'package:flutter/cupertino.dart';

abstract class Handler {
  void handle(Object? state, BuildContext context);
}
