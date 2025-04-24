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

abstract class Movie implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  int year;

  String imageUrl;

  String logline;

  String directorname;

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
