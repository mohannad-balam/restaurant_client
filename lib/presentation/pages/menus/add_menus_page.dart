import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_client/presentation/bloc/menus/menus_bloc.dart';
import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';

@RoutePage()
class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  final List<int> _selectedCategoryIds = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesEvent());
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitMenu() async {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedImage == null ||
        _selectedCategoryIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("⚠️ Please fill all fields and select categories")),
      );
      return;
    }

    FormData formData = FormData.fromMap({
      "name": _nameController.text,
      "description": _descriptionController.text,
      'price': double.parse(_priceController.text),
      "image": _selectedImage != null
          ? await MultipartFile.fromFile(_selectedImage!.path,
              filename: _selectedImage?.path.split('/').last)
          : null,
    });

    BlocProvider.of<MenusBloc>(context).add(
      CreateMenuEvent(
        request: formData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Menu")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              _selectedImage != null
                  ? Image.file(_selectedImage!, height: 100)
                  : const Text("No image selected"),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Pick Image"),
              ),
              const SizedBox(height: 20),

              // Multi-Select Dropdown for Categories
              BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CategoriesLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<int>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: "Select Categories",
                            border: OutlineInputBorder(),
                          ),
                          items: state.categories.map((category) {
                            return DropdownMenuItem<int>(
                              value: category.id,
                              child: Text(category.name.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null &&
                                !_selectedCategoryIds.contains(value)) {
                              setState(() {
                                _selectedCategoryIds.add(value);
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: _selectedCategoryIds.map((id) {
                            String name = state.categories
                                .firstWhere((cat) => cat.id == id)
                                .name
                                .toString();
                            return Chip(
                              label: Text(name),
                              onDeleted: () {
                                setState(() {
                                  _selectedCategoryIds.remove(id);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  } else {
                    return const Text("Failed to load categories");
                  }
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitMenu,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
