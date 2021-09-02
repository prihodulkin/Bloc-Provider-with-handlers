import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/handler.dart';
import 'package:test_proj/business_logic/models/error_state.dart';

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
