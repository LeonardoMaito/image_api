import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import '../models/image_model.dart';
import 'dart:convert';
import '../widgets/image_list.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  int counter = 0;
  List<ImageModel> imagesList = [];

  void fetchImage() async{
    counter++;
    var apiResponse = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter"));
    var imageModel = ImageModel.fromJson(json.decode(apiResponse.body));

    setState(() {
      imagesList.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Simple Image API: $counter'),
        ),
        body: ImageList.withList(imagesList),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add, size: 25),
        ),
      ),
    );
  }
}
