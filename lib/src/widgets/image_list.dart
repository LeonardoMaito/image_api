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

        return buildContainer(imagesList[index]);
     },
        itemCount:imagesList.length,
    );
  }

  Widget buildContainer(ImageModel image){
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(bottom: 8),
              child: Image.network(image.url),
            ),
            Text(image.title, style: const TextStyle(
              fontSize: 15,
              ),
            ),
          ],
        ),
      );
  }
}
