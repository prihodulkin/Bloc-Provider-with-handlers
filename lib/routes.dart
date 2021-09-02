import 'package:flutter/material.dart';
import 'package:test_proj/UI/handlers/error_handler.dart';
import 'package:test_proj/UI/handlers/nick_validation_success_handler.dart';
import 'package:test_proj/UI/pages/second_page.dart';
import 'package:test_proj/UI/widgets/bloc_provider_with_handlers.dart';
import 'package:test_proj/business_logic/bloc/nick_handler_bloc/nick_handler_bloc.dart';
import 'UI/pages/first_page.dart';

class Routes {
  static const String firstPage = '/';
  static const String secondPage = '/secondPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPage:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProviderWithHandlers<NickHandlerBloc, NickHandlerState>(
            create: (context) => NickHandlerBloc(),
            handlers: [ErrorHandler(), NickValidationSuccessHandler()],
            child: FirstPage(),
          ),
        );
      case secondPage:
        return MaterialPageRoute(
          builder: (_) => const SecondPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}
