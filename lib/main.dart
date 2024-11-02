import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation/app_router.dart';
import 'bloc/authentication_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(),
      child: Builder(
        builder: (context) {
          final authBloc = context.read<AuthenticationBloc>();
          final appRouter = AppRouter(authBloc);

          return MaterialApp.router(
            routerDelegate: appRouter.router.routerDelegate,
            routeInformationParser: appRouter.router.routeInformationParser,
            routeInformationProvider: appRouter.router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
