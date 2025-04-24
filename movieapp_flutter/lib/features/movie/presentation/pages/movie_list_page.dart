import 'package:flutter/material.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/dependencies.dart';
import 'package:movieapp_flutter/features/movie/presentation/widget/movie_list_widget.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class MovieListPage extends StatelessWidget {
  static String route() => '/movies';
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        //actions: [SignInWithEmailButton(caller: sl<Client>().modules.auth)],
      ),
      body: MovieListWidget(),
    );
  }
}
