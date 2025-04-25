import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_flutter/features/app_user/presentation/widgets/app_user_dropdown.dart';
import 'package:movieapp_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movieapp_flutter/features/movie/presentation/widget/movie_list_widget.dart';

class MovieListPage extends StatelessWidget {
  static String route() => '/movies';
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        actions: [AppUserDropdown()],
      ),
      body: MovieListWidget(),
    );
  }
}
