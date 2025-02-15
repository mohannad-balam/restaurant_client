import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AddMenuPage extends StatefulWidget {
  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitMenu() async {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠️ Please fill all fields")),
      );
      return;
    }

    FormData formData = FormData.fromMap({
      "name": _nameController.text,
      "description": _descriptionController.text,
      "price": _priceController.text,
      "image": await MultipartFile.fromFile(_selectedImage!.path),
    });

    try {
      Response response = await _dio.post(
        "http://192.168.0.66:8000/api/add-menu", // Change to your API
        data: formData,
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ Menu added successfully!")),
        );
        Navigator.pop(context); // Go back after adding
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: ${response.statusMessage}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("🚨 Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Menu")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 100)
                : Text("No image selected"),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitMenu,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
