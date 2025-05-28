part of 'movie_manage_bloc.dart';

@immutable
sealed class MovieManageState {}

final class MovieManageStateInitial extends MovieManageState {}

final class MovieManageStateLoading extends MovieManageState {}

final class MovieManageStateRetriveSuccess extends MovieManageState {
  final Movie movie;

  MovieManageStateRetriveSuccess({required this.movie});
}

final class MovieManageStateFailur extends MovieManageState {
  final String message;

  MovieManageStateFailur({required this.message});
}

final class MovieManageStateSaveSuccess extends MovieManageState {
  final Movie movie;

  MovieManageStateSaveSuccess({required this.movie});
}

final class MovieManageStateDeleteSuccess extends MovieManageState {}
