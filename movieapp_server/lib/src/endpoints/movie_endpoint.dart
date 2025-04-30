import 'package:movieapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MovieEndpoint extends Endpoint {
  Future<List<Movie>> list(Session session) async {
    return Movie.db.find(session);
  }

  Future<Movie?> retrive(Session session, int id) async {
    return Movie.db.findById(session, id);
  }

  Future<Movie> save(Session session, Movie movie) async {
    try {
      if (movie.id != null) {
        final existing = await Movie.db.findById(session, movie.id!);

        if (existing == null) {
          // If the movie doesn't exist, treat it as a new movie
          return await Movie.db.insertRow(session, movie);
        } else {
          // If the movie exists, update it
          final updatedMovie = await Movie.db.updateRow(session, movie);

          // If update fails (no rows updated), log and throw an error
          if (updatedMovie == null) {
            throw Exception("Failed to update movie with id: ${movie.id}");
          }
          return updatedMovie;
        }
      } else {
        // If no ID is provided, insert as a new movie
        return await Movie.db.insertRow(session, movie);
      }
    } catch (e) {
      // Enhanced error handling
      throw Exception('Failed to save movie: ${e.toString()}');
    }
  }

  Future<void> delete(Session session, int id) async {
    await Movie.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }
}
