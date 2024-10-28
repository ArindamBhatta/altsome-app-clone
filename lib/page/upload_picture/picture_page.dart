import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/picture_provider/upload_picture_provider.dart';

class PicturePage extends StatefulWidget {
  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  //* fetch images
  Future<void> fetchImages() async {
    await Provider.of<UploadPictureProvider>(context, listen: false)
        .fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UploadPictureProvider>(
      builder: (context, StorageService, child) {
        return Scaffold(
          floatingActionButton: newMethod(StorageService),
          body: ListView.builder(
            itemCount: StorageService.imageUrls.length,
            itemBuilder: (context, index) {
              //* get each individual image
              final String imageUrl = StorageService.imageUrls[index];
              return Image.network(imageUrl);
            },
          ),
        );
      },
    );
  }

  FloatingActionButton newMethod(UploadPictureProvider StorageService) {
    return FloatingActionButton(
      onPressed: () => {StorageService.uploadImages()},
      child: const Icon(Icons.cloud_upload_outlined),
    );
  }
}
