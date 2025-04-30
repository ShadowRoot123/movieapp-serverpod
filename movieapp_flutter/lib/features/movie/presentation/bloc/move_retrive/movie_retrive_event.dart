import 'package:flutter/material.dart';

@immutable
sealed class MovieRetriveEvent {}

final class FeachMovieRetriveEvent extends MovieRetriveEvent {
  final int id;
  FeachMovieRetriveEvent(this.id);
}
