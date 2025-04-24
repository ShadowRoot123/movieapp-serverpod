import 'package:get_it/get_it.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/features/movie/data/datasources/move_datasource.dart';
import 'package:movieapp_flutter/features/movie/data/repository/move_repository_impl.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/list_movies.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/retrive_move.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/move_list_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/move_retrive_bloc.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Client>(() => Client("http://localhost:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager())
    ..connectivityMonitor = FlutterConnectivityMonitor());
  sl.registerLazySingleton<SessionManager>(() => SessionManager(
        caller: sl<Client>().modules.auth,
      ));
  await sl<SessionManager>().initialize();
  _initMovie();
}

void _initMovie() {
  sl.registerFactory<MovieDatasource>(() => MoveDatasourceImpl(sl()));

  sl.registerFactory<MovieRepository>(() => MoveRepositoryImpl(sl()));

  sl.registerFactory<ListMoviesUseCase>(() => ListMoviesUseCase(sl()));

  sl.registerFactory<RetriveMoveUsecase>(() => RetriveMoveUsecase(sl()));

  sl.registerLazySingleton(() => MoveListBloc(listMoviesUseCase: sl()));

  sl.registerLazySingleton(() => MoveRetriveBloc(retriveMoveUsecase: sl()));
}
