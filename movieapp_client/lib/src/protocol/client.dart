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
import 'dart:async' as _i2;
import 'package:movieapp_client/src/protocol/movie_details.dart' as _i3;
import 'package:movieapp_client/src/protocol/movie.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointAsset extends _i1.EndpointRef {
  EndpointAsset(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'asset';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'asset',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'asset',
        'verifyUpload',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointMovieDetail extends _i1.EndpointRef {
  EndpointMovieDetail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movieDetail';

  _i2.Future<_i3.MovieDetail?> getByMovieId(int movieId) =>
      caller.callServerEndpoint<_i3.MovieDetail?>(
        'movieDetail',
        'getByMovieId',
        {'movieId': movieId},
      );

  _i2.Future<_i3.MovieDetail> save(_i3.MovieDetail detail) =>
      caller.callServerEndpoint<_i3.MovieDetail>(
        'movieDetail',
        'save',
        {'detail': detail},
      );

  _i2.Future<void> deleteByMovieId(int movieId) =>
      caller.callServerEndpoint<void>(
        'movieDetail',
        'deleteByMovieId',
        {'movieId': movieId},
      );
}

/// {@category Endpoint}
class EndpointMovie extends _i1.EndpointRef {
  EndpointMovie(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movie';

  _i2.Future<List<_i4.Movie>> list() =>
      caller.callServerEndpoint<List<_i4.Movie>>(
        'movie',
        'list',
        {},
      );

  _i2.Future<_i4.Movie?> retrive(int id) =>
      caller.callServerEndpoint<_i4.Movie?>(
        'movie',
        'retrive',
        {'id': id},
      );

  _i2.Future<_i4.Movie> save(_i4.Movie movie) =>
      caller.callServerEndpoint<_i4.Movie>(
        'movie',
        'save',
        {'movie': movie},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'movie',
        'delete',
        {'id': id},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    asset = EndpointAsset(this);
    example = EndpointExample(this);
    movieDetail = EndpointMovieDetail(this);
    movie = EndpointMovie(this);
    modules = Modules(this);
  }

  late final EndpointAsset asset;

  late final EndpointExample example;

  late final EndpointMovieDetail movieDetail;

  late final EndpointMovie movie;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'asset': asset,
        'example': example,
        'movieDetail': movieDetail,
        'movie': movie,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
