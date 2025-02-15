import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'dart:io';

import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';

@RoutePage()
class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print("image => ${_image?.path}");
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        FormData formData = FormData.fromMap({
          "name": _nameController.text,
          "description": _descriptionController.text,
          "image": _image != null
              ? await MultipartFile.fromFile(_image!.path,
                  filename: _image?.path.split('/').last)
              : null,
        });

        BlocProvider.of<CategoriesBloc>(context)
            .add(CreateCategoryEvent(request: formData));
      } catch (e) {
        print("Error uploading: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _image == null
                      ? const Text('No image selected')
                      : Image.file(_image!,
                          width: 100, height: 100, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Pick Image'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Add Category'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
