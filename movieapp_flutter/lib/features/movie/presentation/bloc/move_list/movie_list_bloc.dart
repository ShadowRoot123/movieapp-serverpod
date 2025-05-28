// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_state.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/list_movies.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final ListMoviesUseCase listMoviesUseCase;

  MovieListBloc({
    required this.listMoviesUseCase,
  }) : super(MovieListInitial()) {
    on<MovieListEvent>((event, emit) => emit(MovieListLoading()));
    on<FeachMovieListEvent>(_onFeachMovies);
  }

  Future<void> _onFeachMovies(
      MovieListEvent event, Emitter<MovieListState> emit) async {
    final result = await listMoviesUseCase(NoParams());

    result.fold(
      (failure) {
        emit(MovieListError(failure.message));
      },
      (movies) {
        emit(MovieListSuccess(movies));
      },
    );
  }
}
