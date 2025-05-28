// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/retrive_move.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_state.dart';

class MoveRetriveBloc extends Bloc<MovieRetriveEvent, MovieRetriveState> {
  final RetriveMoveUsecase retriveMoveUsecase;

  MoveRetriveBloc({
    required this.retriveMoveUsecase,
  }) : super(MovierRetriveInitial()) {
    on<FeachMovieRetriveEvent>(_onFeachMovie);
  }

  Future<void> _onFeachMovie(
      FeachMovieRetriveEvent event, Emitter<MovieRetriveState> emit) async {
    emit(MovieRetriveLoading());

    final result = await retriveMoveUsecase(RetriveMoveParams(id: event.id));

    result.fold(
      (failure) {
        emit(MovieRetriveError(failure.message));
      },
      (movie) {
        emit(MovieRetriveSuccess(movie));
      },
    );
  }
}
