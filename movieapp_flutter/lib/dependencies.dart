import 'package:get_it/get_it.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/features/app_user/presentation/cubit/app_user_cubit.dart';
import 'package:movieapp_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:movieapp_flutter/features/asset/data/repository/asset_repository_impl.dart';
import 'package:movieapp_flutter/features/asset/domain/repository/asset_repository.dart';
import 'package:movieapp_flutter/features/asset/domain/usecase/upload_image.dart';
import 'package:movieapp_flutter/features/asset/presentation/bloc/asset_bloc.dart';
import 'package:movieapp_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:movieapp_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:movieapp_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/current_user.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_confirm_registearation.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_login.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_logout.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_registor.dart';
import 'package:movieapp_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movieapp_flutter/features/movie/data/datasources/move_datasource.dart';
import 'package:movieapp_flutter/features/movie/data/repository/move_repository_impl.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/delete_movie.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/list_movies.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/retrive_move.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/save_movie.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_list_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/movie_manage/movie_manage_bloc.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<AppUserCubit>(() => AppUserCubit());

  sl.registerLazySingleton<Client>(() => Client("http://localhost:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager())
    ..connectivityMonitor = FlutterConnectivityMonitor());
  sl.registerLazySingleton<SessionManager>(() => SessionManager(
        caller: sl<Client>().modules.auth,
      ));
  await sl<SessionManager>().initialize();
  _initAuth();
  _initMovie();
  _initAsset();
}

void _initMovie() {
  sl.registerFactory<MovieDatasource>(() => MoveDatasourceImpl(sl()));

  sl.registerFactory<MovieRepository>(() => MoveRepositoryImpl(sl()));

  sl.registerFactory<ListMoviesUseCase>(() => ListMoviesUseCase(sl()));

  sl.registerFactory<RetriveMoveUsecase>(() => RetriveMoveUsecase(sl()));

  sl.registerFactory<SaveMoveUsecase>(() => SaveMoveUsecase(sl()));

  sl.registerFactory<DeleteMoveUsecase>(() => DeleteMoveUsecase(sl()));

  sl.registerLazySingleton(() => MovieListBloc(listMoviesUseCase: sl()));

  sl.registerLazySingleton(() => MoveRetriveBloc(retriveMoveUsecase: sl()));
  sl.registerLazySingleton(() => MovieManageBloc(
      saveMoveUsecase: sl(),
      deleteMoveUsecase: sl(),
      retriveMoveUsecase: sl()));
}

void _initAuth() {
  sl.registerFactory<AuthDataSource>(() => AuthDatasourceImpl(sl(), sl()));
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerFactory<UserLoginUseCase>(() => UserLoginUseCase(sl()));

  sl.registerFactory<CurrentUserUseCase>(() => CurrentUserUseCase(sl()));

  sl.registerFactory<UserLogoutUseCase>(() => UserLogoutUseCase(sl()));

  sl.registerFactory<UserRegisterUseCase>(() => UserRegisterUseCase(sl()));
  sl.registerFactory<UserConfirmRegistrationUseCase>(
      () => UserConfirmRegistrationUseCase(sl()));

  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
        userLoginUseCase: sl(),
        appUserCubit: sl(),
        currentUser: sl(),
        userLogout: sl(),
        userRegister: sl(),
        userConfirmRegistration: sl()),
  );
}

void _initAsset() {
  sl.registerFactory<AssetDataSource>(() => AssetDataSourceImpl(sl()));

  sl.registerFactory<AssetRepository>(() => AssetRepositoryImpl(sl()));

  sl.registerFactory<UploadImageUsecase>(() => UploadImageUsecase(sl()));

  sl.registerLazySingleton<AssetBloc>(
      () => AssetBloc(uploadImageUsecase: sl()));
}
