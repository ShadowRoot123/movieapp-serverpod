// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_state.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/movie_manage/movie_manage_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/pages/movie_edit_page.dart';

class MovieDetailPage extends StatefulWidget {
  static String route({int? movieid}) => '/movies/${movieid ?? ':id'}';

  final int movieId;
  const MovieDetailPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MoveRetriveBloc>().add(FeachMovieRetriveEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoveRetriveBloc, MovieRetriveState>(
      listener: (context, state) {
        if (state is MovieRetriveError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          context.pop();
        }
      },
      builder: (context, state) {
        switch (state) {
          case MovierRetriveInitial():
            return SizedBox();
          case MovieRetriveLoading():
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case MovieRetriveSuccess():
            final movie = state.movie;
            return Scaffold(
              appBar: AppBar(
                title: Text(movie.title),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.push(MovieEditPage.route(movie.id));
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    movie.year.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    movie.directorname,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    movie.logline,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          case MovieRetriveError():
            return Scaffold(
              body: Center(
                child: Text(
                  (state as MovieRetriveError).message,
                ),
              ),
            );
        }
      },
    );
  }
}
