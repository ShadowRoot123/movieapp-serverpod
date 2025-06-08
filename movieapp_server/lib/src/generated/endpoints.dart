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
import '../endpoints/asset_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/movie_detail_endpoint.dart' as _i4;
import '../endpoints/movie_endpoint.dart' as _i5;
import 'package:movieapp_server/src/generated/movie_details.dart' as _i6;
import 'package:movieapp_server/src/generated/movie.dart' as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'asset': _i2.AssetEndpoint()
        ..initialize(
          server,
          'asset',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'movieDetail': _i4.MovieDetailEndpoint()
        ..initialize(
          server,
          'movieDetail',
          null,
        ),
      'movie': _i5.MovieEndpoint()
        ..initialize(
          server,
          'movie',
          null,
        ),
    };
    connectors['asset'] = _i1.EndpointConnector(
      name: 'asset',
      endpoint: endpoints['asset']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['asset'] as _i2.AssetEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['asset'] as _i2.AssetEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['movieDetail'] = _i1.EndpointConnector(
      name: 'movieDetail',
      endpoint: endpoints['movieDetail']!,
      methodConnectors: {
        'getByMovieId': _i1.MethodConnector(
          name: 'getByMovieId',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieDetail'] as _i4.MovieDetailEndpoint)
                  .getByMovieId(
            session,
            params['movieId'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'detail': _i1.ParameterDescription(
              name: 'detail',
              type: _i1.getType<_i6.MovieDetail>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieDetail'] as _i4.MovieDetailEndpoint).save(
            session,
            params['detail'],
          ),
        ),
        'deleteByMovieId': _i1.MethodConnector(
          name: 'deleteByMovieId',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieDetail'] as _i4.MovieDetailEndpoint)
                  .deleteByMovieId(
            session,
            params['movieId'],
          ),
        ),
      },
    );
    connectors['movie'] = _i1.EndpointConnector(
      name: 'movie',
      endpoint: endpoints['movie']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i5.MovieEndpoint).list(session),
        ),
        'retrive': _i1.MethodConnector(
          name: 'retrive',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i5.MovieEndpoint).retrive(
            session,
            params['id'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'movie': _i1.ParameterDescription(
              name: 'movie',
              type: _i1.getType<_i7.Movie>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i5.MovieEndpoint).save(
            session,
            params['movie'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i5.MovieEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
