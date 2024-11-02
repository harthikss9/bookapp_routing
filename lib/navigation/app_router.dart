import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/login_page.dart';
import '../pages/by_author_page.dart';
import '../pages/by_title_page.dart';
import '../pages/profile_page.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../navigation/route_names.dart';
import '../bloc/authentication_bloc.dart';
import '../utils/go_router_refresh_stream.dart';

class AppRouter {
  final AuthenticationBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      ShellRoute(
        builder: (context, state, child) => BottomNavigationBarWidget(child: child),
        routes: [
          GoRoute(
            path: RouteNames.home,
            name: 'home',
            builder: (context, state) => ByAuthorPage(),
          ),
          GoRoute(
            path: RouteNames.byAuthor,
            name: 'byAuthor',
            builder: (context, state) => ByAuthorPage(),
          ),
          GoRoute(
            path: RouteNames.byAuthorDetail,
            name: 'byAuthorDetail',
            builder: (context, state) => Text("By Author Detail Page"),
          ),
          GoRoute(
            path: RouteNames.byTitle,
            name: 'byTitle',
            builder: (context, state) => ByTitlePage(),
          ),
          GoRoute(
            path: RouteNames.byTitleDetail,
            name: 'byTitleDetail',
            builder: (context, state) => Text("By Title Detail Page"),
          ),
          GoRoute(
            path: RouteNames.profile,
            name: 'profile',
            builder: (context, state) => ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => LoginPage(),
      ),
    ],
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final isLoggedIn = authBloc.state == AuthenticationState.loggedIn;
      final loggingIn = state.uri.toString() == RouteNames.login;

      if (!isLoggedIn && !loggingIn) return RouteNames.login;
      if (isLoggedIn && loggingIn) return RouteNames.byAuthor;
      return null;
    },
  );
}
