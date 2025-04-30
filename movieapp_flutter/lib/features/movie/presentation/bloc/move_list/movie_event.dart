import 'package:flutter/material.dart';

@immutable
sealed class MovieListEvent {
  const MovieListEvent();
}

final class FeachMovieListEvent extends MovieListEvent {}
