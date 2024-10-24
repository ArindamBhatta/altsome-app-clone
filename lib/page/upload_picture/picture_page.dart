import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/storage/storage_service.dart';

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
    await Provider.of<initialize>(context, listen: false).fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<initialize>(
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

  FloatingActionButton newMethod(initialize StorageService) {
    return FloatingActionButton(
      onPressed: () => {StorageService.uploadImages()},
      child: const Icon(Icons.cloud_upload_outlined),
    );
  }
}
