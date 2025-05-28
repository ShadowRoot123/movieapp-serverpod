// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/delete_movie.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/retrive_move.dart';
import 'package:movieapp_flutter/features/movie/domain/usecases/save_movie.dart';

part 'movie_manage_event.dart';
part 'movie_manage_state.dart';

class MovieManageBloc extends Bloc<MovieManageEvent, MovieManageState> {
  final SaveMoveUsecase saveMoveUsecase;
  final DeleteMoveUsecase deleteMoveUsecase;
  final RetriveMoveUsecase retriveMoveUsecase;

  MovieManageBloc({
    required this.saveMoveUsecase,
    required this.deleteMoveUsecase,
    required this.retriveMoveUsecase,
  }) : super(MovieManageStateInitial()) {
    on<MovieManageEvent>((event, emit) => emit(MovieManageStateLoading()));
    on<MovieManageRetriveEvent>(_onRetriveMove);
    on<MovieManageSaveEvent>(_onSaveMove);
    on<MovieManageDeleteEvent>(_onDeleteMove);
  }

  FutureOr<void> _onRetriveMove(
      MovieManageRetriveEvent event, Emitter<MovieManageState> emit) async {
    final result = await retriveMoveUsecase(RetriveMoveParams(id: event.id));
    result.fold(
      (failure) {
        emit(MovieManageStateFailur(message: failure.message));
      },
      (movie) {
        emit(MovieManageStateRetriveSuccess(movie: movie));
      },
    );
  }

  FutureOr<void> _onSaveMove(
      MovieManageSaveEvent event, Emitter<MovieManageState> emit) async {
    final result = await saveMoveUsecase(SaveMoveParams(movie: event.movie));
    result.fold(
      (failure) {
        emit(MovieManageStateFailur(message: failure.message));
      },
      (movie) {
        emit(MovieManageStateSaveSuccess(movie: movie));
      },
    );
  }

  FutureOr<void> _onDeleteMove(
      MovieManageDeleteEvent event, Emitter<MovieManageState> emit) async {
    final result = await deleteMoveUsecase(DeleteMoveParams(id: event.id));
    result.fold(
      (failure) {
        emit(MovieManageStateFailur(message: failure.message));
      },
      (success) {
        emit(MovieManageStateDeleteSuccess());
      },
    );
  }
}
