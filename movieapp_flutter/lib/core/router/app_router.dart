import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_flutter/features/app_user/presentation/cubit/app_user_cubit.dart';
import 'package:movieapp_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movieapp_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:movieapp_flutter/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:movieapp_flutter/features/movie/presentation/pages/movie_list_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: LoginPage.route(),
    routes: [
      GoRoute(
        path: LoginPage.route(),
        builder: (context, _) => const LoginPage(),
      ),
      GoRoute(
        path: MovieListPage.route(),
        builder: (context, _) => const MovieListPage(),
      ),
      GoRoute(
        path: MovieDetailPage.route(),
        builder: (context, state) => MovieDetailPage(
            movieId: int.parse(state.pathParameters['id'] ?? '0')),
      )
    ],
    redirect: (context, state) {
      final userState = context.read<AuthBloc>().state;

      final publicRoutes = [
        LoginPage.route(),
      ];

      if (!publicRoutes.contains(state.matchedLocation)) {
        if (userState is AppUserInitial) {
          return LoginPage.route();
        }
      }

      return null;
    },
  );
}
