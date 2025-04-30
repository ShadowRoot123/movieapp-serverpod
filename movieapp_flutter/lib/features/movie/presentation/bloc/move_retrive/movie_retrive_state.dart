import 'package:flutter/material.dart';
import 'package:movieapp_client/movieapp_client.dart';

@immutable
sealed class MovieRetriveState {
  const MovieRetriveState();
}

final class MovierRetriveInitial extends MovieRetriveState {}

final class MovieRetriveLoading extends MovieRetriveState {}

final class MovieRetriveSuccess extends MovieRetriveState {
  final Movie movie;

  const MovieRetriveSuccess(this.movie);
}

final class MovieRetriveError extends MovieRetriveState {
  final String message;

  const MovieRetriveError(this.message);
}
