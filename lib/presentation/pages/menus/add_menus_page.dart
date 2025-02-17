import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/presentation/bloc/menus/menus_bloc.dart';
import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';
import 'package:reservation_client/presentation/widgets/custom_snackbar.dart';

import '../../../core/common/widgets/custom_text_field.dart';

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

  final List<int> _selectedCategoryIds = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesEvent());
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await locator<ImagePicker>().pickImage(source: ImageSource.gallery);
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
      mySnackBar("please fill the required fiedls", false);
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
      "categories[]": _selectedCategoryIds,
    });

    BlocProvider.of<MenusBloc>(context).add(
      CreateMenuEvent(
        request: formData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createMenu),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              label: 'Name',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              icon: Icons.menu,
              keyboardType: TextInputType.name,
            ),
            CustomTextField(
              controller: _descriptionController,
              label: 'Description',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              icon: Icons.description,
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: _priceController,
              label: 'Price',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
              icon: Icons.price_change,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 100)
                : const Text(Strings.noImageSelected),
            MainButton(
              onPressed: _pickImage,
              title: Strings.pickImage,
              borderStyle: true,
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
                            deleteIconColor: AppColors.mainColor,
                            label: Text(
                              name,
                              style: currentTheme.textTheme.labelLarge!
                                  .copyWith(color: AppColors.mainColor),
                            ),
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
                  return const Text(Strings.loadFail);
                }
              },
            ),

            const SizedBox(height: 20),
            MainButton(
              onPressed: _submitMenu,
              title: Strings.create,
              borderStyle: false,
            ),
          ],
        ),
      ),
    );
  }
}
