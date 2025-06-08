import 'package:movieapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MovieDetailEndpoint extends Endpoint {
  Future<MovieDetail?> getByMovieId(Session session, int movieId) async {
    return MovieDetail.db.findFirstRow(
      session,
      where: (t) => t.movieId.equals(movieId),
    );
  }

  Future<MovieDetail> save(Session session, MovieDetail detail) async {
    if (detail.id != null) {
      return await MovieDetail.db.updateRow(session, detail) ?? detail;
    } else {
      return await MovieDetail.db.insertRow(session, detail);
    }
  }

  Future<void> deleteByMovieId(Session session, int movieId) async {
    await MovieDetail.db.deleteWhere(
      session,
      where: (t) => t.movieId.equals(movieId),
    );
  }
}
