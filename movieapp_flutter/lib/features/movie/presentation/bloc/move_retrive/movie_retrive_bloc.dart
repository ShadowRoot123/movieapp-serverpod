// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/retrive_move.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_state.dart';

class MoveRetriveBloc extends Bloc<MovieRetriveEvent, MovieRetriveState> {
  final RetriveMoveUsecase retriveMoveUsecase;
  final GetMovieDetailUseCase getMovieDetailUseCase;

  MoveRetriveBloc({
    required this.retriveMoveUsecase,
    required this.getMovieDetailUseCase,
  }) : super(MovierRetriveInitial()) {
    on<FeachMovieRetriveEvent>(_onFeachMovie);
  }

  Future<void> _onFeachMovie(
    FeachMovieRetriveEvent event,
    Emitter<MovieRetriveState> emit,
  ) async {
    emit(MovieRetriveLoading());

    final movieResult =
        await retriveMoveUsecase(RetriveMoveParams(id: event.id));

    await movieResult.fold(
      (failure) async {
        emit(MovieRetriveError(failure.message));
      },
      (movie) async {
        final detailResult = await getMovieDetailUseCase(event.id);
        detailResult.fold(
          (failure) {
            emit(MovieRetriveError(failure.message));
          },
          (movieDetail) {
            emit(MovieRetriveSuccess(movie: movie, movieDetail: movieDetail!));
          },
        );
      },
    );
  }
}
