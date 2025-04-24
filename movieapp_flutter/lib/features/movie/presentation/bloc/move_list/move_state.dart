import 'package:flutter/material.dart';
import 'package:movieapp_client/movieapp_client.dart';

@immutable
sealed class MovieListState {
  const MovieListState();
}

final class MovieListInitial extends MovieListState {}

final class MovieListLoading extends MovieListState {}

final class MovieListSuccess extends MovieListState {
  final List<Movie> movies;

  const MovieListSuccess(this.movies);
}

final class MovieListError extends MovieListState {
  final String message;

  const MovieListError(this.message);
}
