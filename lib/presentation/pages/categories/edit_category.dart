import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'dart:io';

import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';

@RoutePage()
class EditCategoryPage extends StatefulWidget {
  final CategoryEntity categoryEntity;
  const EditCategoryPage({super.key, required this.categoryEntity});

  @override
  _EditCategoryPageState createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
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
        debugPrint("image => ${_image?.path}");
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission (e.g., send data to API)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category added successfully')),
      );
      BlocProvider.of<CategoriesBloc>(context).add(UpdateCategoryEvent(
          request: CreateCategoryRequest(
              id: widget.categoryEntity.id.toString(),
              name: _nameController.text,
              description: _descriptionController.text,
              image: 'dscfvR')));
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.categoryEntity.name ?? '';
    _descriptionController.text = widget.categoryEntity.description ?? '';
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
                  child: const Text('Update Category'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
