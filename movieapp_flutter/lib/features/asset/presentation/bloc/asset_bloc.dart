// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:movieapp_flutter/features/asset/domain/usecase/upload_image.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  final UploadImageUsecase uploadImageUsecase;
  AssetBloc({
    required this.uploadImageUsecase,
  }) : super(AssetStateInitial()) {
    on<AssetEvent>((event, emit) => emit(AssetStateLoading()));
    on<AssetUploadImageEvent>(_handelUploadImage);
  }

  FutureOr<void> _handelUploadImage(
      AssetUploadImageEvent event, Emitter<AssetState> emit) async {
    final result =
        await uploadImageUsecase(UploadImageParams(image: event.image));

    result.fold((failure) => emit(AssetStateFailure(failure.message)),
        (url) => emit(AssetStateSuccess(url)));
  }
}
