import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key? key, required this.imagesList}) : super(key: key);

  final List<ImageModel> imagesList;

  const ImageList.withList(this.imagesList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {

        return Image.network(imagesList[index].url);
     },
        itemCount:imagesList.length,
    );
  }
}
