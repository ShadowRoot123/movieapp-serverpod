part of 'movie_manage_bloc.dart';

@immutable
sealed class MovieManageEvent {}

final class MovieManageRetriveEvent extends MovieManageEvent {
  final int id;

  MovieManageRetriveEvent({required this.id});
}

final class MovieManageSaveEvent extends MovieManageEvent {
  final Movie movie;

  MovieManageSaveEvent({required this.movie});
}

final class MovieManageSaveDetailEvent extends MovieManageEvent {
  final MovieDetail movieDetail;

  MovieManageSaveDetailEvent({required this.movieDetail});
}

final class MovieManageDeleteEvent extends MovieManageEvent {
  final int id;

  MovieManageDeleteEvent({required this.id});
}
