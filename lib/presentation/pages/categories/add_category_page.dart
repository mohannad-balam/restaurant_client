import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_client/core/common/widgets/custom_text_field.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
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
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        debugPrint("image => ${_image?.path}");
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
        debugPrint("Error uploading: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                icon: Icons.category,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _descriptionController,
                label: 'Description',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                icon: Icons.description,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _image == null
                      ? const Text('No image selected')
                      : Image.file(_image!,
                          width: 100, height: 100, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  MainButton(
                    onPressed: _pickImage,
                    title: 'Pick Image',
                    borderStyle: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: MainButton(
                  onPressed: _submitForm,
                  title: 'Add Category',
                  borderStyle: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
