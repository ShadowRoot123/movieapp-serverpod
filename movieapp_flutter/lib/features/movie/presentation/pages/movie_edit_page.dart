// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_list_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_list/movie_state.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/move_retrive/movie_retrive_event.dart';
import 'package:movieapp_flutter/features/movie/presentation/bloc/movie_manage/movie_manage_bloc.dart';

class MovieEditPage extends StatefulWidget {
  final int? movieId;

  static String route([int? movieId]) => '/movie/edit/${movieId ?? ':id'}';
  static String routeNew() => '/movie/new';
  const MovieEditPage({
    Key? key,
    this.movieId,
  }) : super(key: key);

  @override
  State<MovieEditPage> createState() => _MovieEditPageState();
}

class _MovieEditPageState extends State<MovieEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  final _loglineController = TextEditingController();
  final _dirctorNameController = TextEditingController();

  bool get isEditing {
    return widget.movieId != null && widget.movieId != 0;
  }

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      context
          .read<MovieManageBloc>()
          .add(MovieManageRetriveEvent(id: widget.movieId!));
      print("editing ${widget.movieId}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Movie' : 'New Movie'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final movie = Movie(
                  id: widget.movieId,
                  title: _titleController.text,
                  year: int.parse(_yearController.text),
                  logline: _loglineController.text,
                  imageUrl: "",
                  directorname: _dirctorNameController.text,
                );
                context.read<MovieManageBloc>().add(
                      MovieManageSaveEvent(
                        movie: movie,
                      ),
                    );
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: BlocConsumer<MovieManageBloc, MovieManageState>(
          builder: (context, state) {
        if (state is MovieListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _yearController,
                      decoration: const InputDecoration(labelText: 'Year'),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a year';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid year';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _loglineController,
                      decoration: const InputDecoration(labelText: 'Logline'),
                      minLines: 3,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a logline';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _dirctorNameController,
                      decoration:
                          const InputDecoration(labelText: 'Director Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a director name';
                        }
                        return null;
                      },
                    ),
                    if (isEditing)
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<MovieManageBloc>().add(
                                  MovieManageDeleteEvent(id: widget.movieId!));
                              print("Deleting movie ${widget.movieId}");
                            },
                            child: Text("Delete")),
                      )
                  ],
                )),
          ),
        );
      }, listener: (context, state) {
        if (state is MovieManageStateFailur) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is MovieManageStateSaveSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie saved successfully'),
            ),
          );
          context.read<MovieListBloc>().add(
                FeachMovieListEvent(),
              );
          if (isEditing) {
            context
                .read<MoveRetriveBloc>()
                .add(FeachMovieRetriveEvent(widget.movieId!));
          }
          context.pop();
        } else if (state is MovieManageStateDeleteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie deleted successfully'),
            ),
          );
          context.read<MovieListBloc>().add(
                FeachMovieListEvent(),
              );
          context.pop();
          context.pop();
        } else if (state is MovieManageStateRetriveSuccess) {
          _titleController.text = state.movie.title;
          _yearController.text = state.movie.year.toString();
          _loglineController.text = state.movie.logline;
          _dirctorNameController.text = state.movie.directorname;
        }
      }),
    );
  }
}
