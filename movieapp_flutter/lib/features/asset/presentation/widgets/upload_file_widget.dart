// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieapp_flutter/features/asset/presentation/bloc/asset_bloc.dart';

class UploadFileWidget extends StatelessWidget {
  final String url;
  final String label;
  final Function(String url) onComplet;
  const UploadFileWidget({
    Key? key,
    required this.url,
    this.label = "file",
    required this.onComplet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssetBloc, AssetState>(
      listener: (context, state) {
        if (state is AssetStateSuccess) {
          onComplet(state.url);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label),
                if (url.isNotEmpty)
                  Image.network(
                    url,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        if (context.mounted) {
                          context
                              .read<AssetBloc>()
                              .add(AssetUploadImageEvent(image: image));
                        }
                      }
                    },
                    child: Text(url.isEmpty ? "upload" : "Replace"))
              ],
            )
          ],
        );
      },
    );
  }
}
