import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_list_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_state.dart';
import 'package:movieapp_flutter/features/movie/presentation/pages/movie_detail_page.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MovieListBloc>().add(FeachMovieListEvent());
  }

  @override
  void dispose() {
    // BlocProvider.of<MovieListBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
      builder: (context, state) {
        switch (state) {
          case MovieListInitial():
            return SizedBox.shrink();
          case MovieListLoading():
            return Center(
              child: CircularProgressIndicator(),
            );
          case MovieListSuccess():
            final movies = state.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Card(
                  child: ListTile(
                    title: Text(movie.title),
                    subtitle: Text("Released in ${movie.year}"),
                    onTap: () {
                      context.push(MovieDetailPage.route(movieid: movie.id));
                    },
                  ),
                );
              },
            );
          case MovieListError():
            return Center(
              child: Text(
                (state as MovieListError).message,
                style: TextStyle(color: Colors.red),
              ),
            );
        }
      },
    );
  }
}
