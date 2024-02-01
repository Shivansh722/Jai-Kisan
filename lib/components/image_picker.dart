import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _selectedImage;
  String? _resultClass;
  double? _resultConfidence;

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
      _resultClass = null;
      _resultConfidence = null;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
      _resultClass = null;
      _resultConfidence = null;
    });
  }

  Future<void> _submitImage() async {
    if (_selectedImage == null) {
      // No image selected
      return;
    }

    final apiUrl = Uri.parse("http://127.0.0.1:5000/predictleaf");
    final imageBytes = await _selectedImage!.readAsBytes();
    final response = await http.post(
      apiUrl,
      body: imageBytes,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _resultClass = data['class'];
        _resultConfidence = data['confidence'];
      });
    } else {
      // Handle API error
      print("API Error: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _takePicture,
              child: const Text('Capture Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitImage,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            if (_resultClass != null && _resultConfidence != null)
              Column(
                children: [
                  Text('Class: $_resultClass'),
                  Text('Confidence: $_resultConfidence'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
