import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:apec_app/image_picker.dart';

class ImagePickerPage extends StatefulWidget {

  @override
  _ImagePickerPageState createState() => new _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  Future<File> _imageFile;

  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: new Center(
        child: new FutureBuilder<File>(
          future: _imageFile,
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return new Image.file(snapshot.data);
            } else if (snapshot.error != null) {
              return const Text('error picking image.');
            } else {
              return const Text('You have not yet picked an image.');
            }
          },
        ),
      ),
      floatingActionButton: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FloatingActionButton(
            heroTag: "gallery",
            onPressed: () => _onImageButtonPressed(ImageSource.gallery),
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FloatingActionButton(
              heroTag: "camera",
              onPressed: () => _onImageButtonPressed(ImageSource.camera),
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}