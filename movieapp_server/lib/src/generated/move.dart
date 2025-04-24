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

abstract class Movie implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Movie._({
    this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.logline,
    required this.directorname,
  });

  factory Movie({
    int? id,
    required String title,
    required int year,
    required String imageUrl,
    required String logline,
    required String directorname,
  }) = _MovieImpl;

  factory Movie.fromJson(Map<String, dynamic> jsonSerialization) {
    return Movie(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      year: jsonSerialization['year'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
      logline: jsonSerialization['logline'] as String,
      directorname: jsonSerialization['directorname'] as String,
    );
  }

  static final t = MovieTable();

  static const db = MovieRepository._();

  @override
  int? id;

  String title;

  int year;

  String imageUrl;

  String logline;

  String directorname;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Movie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Movie copyWith({
    int? id,
    String? title,
    int? year,
    String? imageUrl,
    String? logline,
    String? directorname,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'logline': logline,
      'directorname': directorname,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'logline': logline,
      'directorname': directorname,
    };
  }

  static MovieInclude include() {
    return MovieInclude._();
  }

  static MovieIncludeList includeList({
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    MovieInclude? include,
  }) {
    return MovieIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Movie.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Movie.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MovieImpl extends Movie {
  _MovieImpl({
    int? id,
    required String title,
    required int year,
    required String imageUrl,
    required String logline,
    required String directorname,
  }) : super._(
          id: id,
          title: title,
          year: year,
          imageUrl: imageUrl,
          logline: logline,
          directorname: directorname,
        );

  /// Returns a shallow copy of this [Movie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Movie copyWith({
    Object? id = _Undefined,
    String? title,
    int? year,
    String? imageUrl,
    String? logline,
    String? directorname,
  }) {
    return Movie(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      logline: logline ?? this.logline,
      directorname: directorname ?? this.directorname,
    );
  }
}

class MovieTable extends _i1.Table<int> {
  MovieTable({super.tableRelation}) : super(tableName: 'movies') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    year = _i1.ColumnInt(
      'year',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    logline = _i1.ColumnString(
      'logline',
      this,
    );
    directorname = _i1.ColumnString(
      'directorname',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt year;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnString logline;

  late final _i1.ColumnString directorname;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        year,
        imageUrl,
        logline,
        directorname,
      ];
}

class MovieInclude extends _i1.IncludeObject {
  MovieInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Movie.t;
}

class MovieIncludeList extends _i1.IncludeList {
  MovieIncludeList._({
    _i1.WhereExpressionBuilder<MovieTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Movie.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Movie.t;
}

class MovieRepository {
  const MovieRepository._();

  /// Returns a list of [Movie]s matching the given query parameters.
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
  Future<List<Movie>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Movie>(
      where: where?.call(Movie.t),
      orderBy: orderBy?.call(Movie.t),
      orderByList: orderByList?.call(Movie.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Movie] matching the given query parameters.
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
  Future<Movie?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Movie>(
      where: where?.call(Movie.t),
      orderBy: orderBy?.call(Movie.t),
      orderByList: orderByList?.call(Movie.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Movie] by its [id] or null if no such row exists.
  Future<Movie?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Movie>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Movie]s in the list and returns the inserted rows.
  ///
  /// The returned [Movie]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Movie>> insert(
    _i1.Session session,
    List<Movie> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Movie>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Movie] and returns the inserted row.
  ///
  /// The returned [Movie] will have its `id` field set.
  Future<Movie> insertRow(
    _i1.Session session,
    Movie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Movie>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Movie]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Movie>> update(
    _i1.Session session,
    List<Movie> rows, {
    _i1.ColumnSelections<MovieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Movie>(
      rows,
      columns: columns?.call(Movie.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Movie]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Movie> updateRow(
    _i1.Session session,
    Movie row, {
    _i1.ColumnSelections<MovieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Movie>(
      row,
      columns: columns?.call(Movie.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Movie]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Movie>> delete(
    _i1.Session session,
    List<Movie> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Movie>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Movie].
  Future<Movie> deleteRow(
    _i1.Session session,
    Movie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Movie>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Movie>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovieTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Movie>(
      where: where(Movie.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Movie>(
      where: where?.call(Movie.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
