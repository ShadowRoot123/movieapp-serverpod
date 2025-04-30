// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';
import 'package:movieapp_flutter/core/util/string.dart';

abstract interface class AssetDataSource {
  Future<String> uploadImage(XFile image);
}

class AssetDataSourceImpl implements AssetDataSource {
  final Client client;
  AssetDataSourceImpl(
    this.client,
  );

  @override
  Future<String> uploadImage(XFile image) async {
    final name = "${generateRandomString(16)}.${image.path.split('.').last}";

    final uploadDescription = await client.asset.getUploadDescription(name);
    print(uploadDescription);

    if (uploadDescription == null) {
      throw ServerException("upload not successful");
    }

    final uploader = FileUploader(uploadDescription);

    final stream = image.openRead();
    final length = (await image.readAsBytes()).length;

    await uploader.upload(stream, length);

    final success = await client.asset.verifyUpload(name);

    if (!success) {
      throw ServerException("Uploded faild");
    }

    final Map<String, dynamic> decodeDescription =
        jsonDecode(uploadDescription);

    if (decodeDescription.containsKey('url')) {
      final url = "${decodeDescription['url']}/$name";
      print(url);
      return url;
    } else {
      throw ServerException("No upload Url");
    }
  }
}
