import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_flutter/features/app_user/presentation/cubit/app_user_cubit.dart';
import 'package:movieapp_flutter/core/router/app_router.dart';
import 'package:movieapp_flutter/dependencies.dart';
import 'package:movieapp_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/move_list_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/move_retrive_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AppUserCubit>()),
        BlocProvider(create: (_) => sl<MoveListBloc>()),
        BlocProvider(create: (_) => sl<MoveRetriveBloc>()),
        BlocProvider(
            create: (_) => sl<AuthBloc>()..add(AuthIsUserLoggedInEvent())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserCubit, AppUserState>(
      listener: (context, state) {
        AppRouter.router.refresh();
      },
      child: MaterialApp.router(
        title: 'Movie App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
