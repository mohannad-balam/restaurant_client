import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';

import '../../../core/common/widgets/custom_text_field.dart';

@RoutePage()
class AddTablePage extends StatefulWidget {
  const AddTablePage({super.key});

  @override
  _AddTablePageState createState() => _AddTablePageState();
}

class _AddTablePageState extends State<AddTablePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  String _selectedLocation = 'front';
  String _selectedStatus = 'pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.addTable)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: 'Table Name',
                controller: _nameController,
                icon: Icons.table_bar,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Guest Number',
                controller: _guestNumberController,
                icon: Icons.emoji_people,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedLocation,
                decoration: InputDecoration(labelText: Strings.location),
                items: [
                  Strings.front,
                  Strings.inside,
                  Strings.outside,
                ]
                    .map(
                        (loc) => DropdownMenuItem(value: loc, child: Text(loc)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: InputDecoration(labelText: Strings.status),
                items: [
                  Strings.pending.toLowerCase(),
                  Strings.availabel.toLowerCase(),
                  Strings.unAvailable.toLowerCase(),
                ]
                    .map((status) =>
                        DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  onPressed: () {
                    BlocProvider.of<TablesBloc>(context).add(CreateTableEvent(
                        request: CreateTableRequest(
                      name: _nameController.text,
                      guestNumber: int.parse(_guestNumberController.text),
                      status: _selectedStatus,
                      location: _selectedLocation,
                    )));
                  },
                  title: Strings.create,
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
