/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'movie.dart' as _i2;

abstract class MovieDetail
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
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

  static final t = MovieDetailTable();

  static const db = MovieDetailRepository._();

  @override
  int? id;

  int movieId;

  _i2.Movie? movie;

  int? runtime;

  double? budget;

  double? boxOffice;

  String? awards;

  @override
  _i1.Table<int> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'movieId': movieId,
      if (movie != null) 'movie': movie?.toJsonForProtocol(),
      if (runtime != null) 'runtime': runtime,
      if (budget != null) 'budget': budget,
      if (boxOffice != null) 'boxOffice': boxOffice,
      if (awards != null) 'awards': awards,
    };
  }

  static MovieDetailInclude include({_i2.MovieInclude? movie}) {
    return MovieDetailInclude._(movie: movie);
  }

  static MovieDetailIncludeList includeList({
    _i1.WhereExpressionBuilder<MovieDetailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDetailTable>? orderByList,
    MovieDetailInclude? include,
  }) {
    return MovieDetailIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MovieDetail.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MovieDetail.t),
      include: include,
    );
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

class MovieDetailTable extends _i1.Table<int> {
  MovieDetailTable({super.tableRelation}) : super(tableName: 'movie_details') {
    movieId = _i1.ColumnInt(
      'movieId',
      this,
    );
    runtime = _i1.ColumnInt(
      'runtime',
      this,
    );
    budget = _i1.ColumnDouble(
      'budget',
      this,
    );
    boxOffice = _i1.ColumnDouble(
      'boxOffice',
      this,
    );
    awards = _i1.ColumnString(
      'awards',
      this,
    );
  }

  late final _i1.ColumnInt movieId;

  _i2.MovieTable? _movie;

  late final _i1.ColumnInt runtime;

  late final _i1.ColumnDouble budget;

  late final _i1.ColumnDouble boxOffice;

  late final _i1.ColumnString awards;

  _i2.MovieTable get movie {
    if (_movie != null) return _movie!;
    _movie = _i1.createRelationTable(
      relationFieldName: 'movie',
      field: MovieDetail.t.movieId,
      foreignField: _i2.Movie.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MovieTable(tableRelation: foreignTableRelation),
    );
    return _movie!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        movieId,
        runtime,
        budget,
        boxOffice,
        awards,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'movie') {
      return movie;
    }
    return null;
  }
}

class MovieDetailInclude extends _i1.IncludeObject {
  MovieDetailInclude._({_i2.MovieInclude? movie}) {
    _movie = movie;
  }

  _i2.MovieInclude? _movie;

  @override
  Map<String, _i1.Include?> get includes => {'movie': _movie};

  @override
  _i1.Table<int> get table => MovieDetail.t;
}

class MovieDetailIncludeList extends _i1.IncludeList {
  MovieDetailIncludeList._({
    _i1.WhereExpressionBuilder<MovieDetailTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MovieDetail.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => MovieDetail.t;
}

class MovieDetailRepository {
  const MovieDetailRepository._();

  final attachRow = const MovieDetailAttachRowRepository._();

  /// Returns a list of [MovieDetail]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MovieDetail>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDetailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDetailTable>? orderByList,
    _i1.Transaction? transaction,
    MovieDetailInclude? include,
  }) async {
    return session.db.find<MovieDetail>(
      where: where?.call(MovieDetail.t),
      orderBy: orderBy?.call(MovieDetail.t),
      orderByList: orderByList?.call(MovieDetail.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MovieDetail] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MovieDetail?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDetailTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovieDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDetailTable>? orderByList,
    _i1.Transaction? transaction,
    MovieDetailInclude? include,
  }) async {
    return session.db.findFirstRow<MovieDetail>(
      where: where?.call(MovieDetail.t),
      orderBy: orderBy?.call(MovieDetail.t),
      orderByList: orderByList?.call(MovieDetail.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MovieDetail] by its [id] or null if no such row exists.
  Future<MovieDetail?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MovieDetailInclude? include,
  }) async {
    return session.db.findById<MovieDetail>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MovieDetail]s in the list and returns the inserted rows.
  ///
  /// The returned [MovieDetail]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MovieDetail>> insert(
    _i1.Session session,
    List<MovieDetail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MovieDetail>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MovieDetail] and returns the inserted row.
  ///
  /// The returned [MovieDetail] will have its `id` field set.
  Future<MovieDetail> insertRow(
    _i1.Session session,
    MovieDetail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MovieDetail>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MovieDetail]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MovieDetail>> update(
    _i1.Session session,
    List<MovieDetail> rows, {
    _i1.ColumnSelections<MovieDetailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MovieDetail>(
      rows,
      columns: columns?.call(MovieDetail.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MovieDetail]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MovieDetail> updateRow(
    _i1.Session session,
    MovieDetail row, {
    _i1.ColumnSelections<MovieDetailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MovieDetail>(
      row,
      columns: columns?.call(MovieDetail.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MovieDetail]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MovieDetail>> delete(
    _i1.Session session,
    List<MovieDetail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MovieDetail>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MovieDetail].
  Future<MovieDetail> deleteRow(
    _i1.Session session,
    MovieDetail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MovieDetail>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MovieDetail>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovieDetailTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MovieDetail>(
      where: where(MovieDetail.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDetailTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MovieDetail>(
      where: where?.call(MovieDetail.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MovieDetailAttachRowRepository {
  const MovieDetailAttachRowRepository._();

  /// Creates a relation between the given [MovieDetail] and [Movie]
  /// by setting the [MovieDetail]'s foreign key `movieId` to refer to the [Movie].
  Future<void> movie(
    _i1.Session session,
    MovieDetail movieDetail,
    _i2.Movie movie, {
    _i1.Transaction? transaction,
  }) async {
    if (movieDetail.id == null) {
      throw ArgumentError.notNull('movieDetail.id');
    }
    if (movie.id == null) {
      throw ArgumentError.notNull('movie.id');
    }

    var $movieDetail = movieDetail.copyWith(movieId: movie.id);
    await session.db.updateRow<MovieDetail>(
      $movieDetail,
      columns: [MovieDetail.t.movieId],
      transaction: transaction,
    );
  }
}
