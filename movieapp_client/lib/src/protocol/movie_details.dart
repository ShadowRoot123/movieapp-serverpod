/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'movie.dart' as _i2;

abstract class MovieDetail implements _i1.SerializableModel {
  MovieDetail._({
    this.id,
    required this.movieId,
    this.movie,
    this.runtime,
    this.budget,
    this.boxOffice,
    this.awards,
  });

  factory MovieDetail({
    int? id,
    required int movieId,
    _i2.Movie? movie,
    int? runtime,
    double? budget,
    double? boxOffice,
    String? awards,
  }) = _MovieDetailImpl;

  factory MovieDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return MovieDetail(
      id: jsonSerialization['id'] as int?,
      movieId: jsonSerialization['movieId'] as int,
      movie: jsonSerialization['movie'] == null
          ? null
          : _i2.Movie.fromJson(
              (jsonSerialization['movie'] as Map<String, dynamic>)),
      runtime: jsonSerialization['runtime'] as int?,
      budget: (jsonSerialization['budget'] as num?)?.toDouble(),
      boxOffice: (jsonSerialization['boxOffice'] as num?)?.toDouble(),
      awards: jsonSerialization['awards'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int movieId;

  _i2.Movie? movie;

  int? runtime;

  double? budget;

  double? boxOffice;

  String? awards;

  /// Returns a shallow copy of this [MovieDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MovieDetail copyWith({
    int? id,
    int? movieId,
    _i2.Movie? movie,
    int? runtime,
    double? budget,
    double? boxOffice,
    String? awards,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'movieId': movieId,
      if (movie != null) 'movie': movie?.toJson(),
      if (runtime != null) 'runtime': runtime,
      if (budget != null) 'budget': budget,
      if (boxOffice != null) 'boxOffice': boxOffice,
      if (awards != null) 'awards': awards,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MovieDetailImpl extends MovieDetail {
  _MovieDetailImpl({
    int? id,
    required int movieId,
    _i2.Movie? movie,
    int? runtime,
    double? budget,
    double? boxOffice,
    String? awards,
  }) : super._(
          id: id,
          movieId: movieId,
          movie: movie,
          runtime: runtime,
          budget: budget,
          boxOffice: boxOffice,
          awards: awards,
        );

  /// Returns a shallow copy of this [MovieDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MovieDetail copyWith({
    Object? id = _Undefined,
    int? movieId,
    Object? movie = _Undefined,
    Object? runtime = _Undefined,
    Object? budget = _Undefined,
    Object? boxOffice = _Undefined,
    Object? awards = _Undefined,
  }) {
    return MovieDetail(
      id: id is int? ? id : this.id,
      movieId: movieId ?? this.movieId,
      movie: movie is _i2.Movie? ? movie : this.movie?.copyWith(),
      runtime: runtime is int? ? runtime : this.runtime,
      budget: budget is double? ? budget : this.budget,
      boxOffice: boxOffice is double? ? boxOffice : this.boxOffice,
      awards: awards is String? ? awards : this.awards,
    );
  }
}
