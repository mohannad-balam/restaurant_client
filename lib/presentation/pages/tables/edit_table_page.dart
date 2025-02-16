import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';

import '../../../core/common/widgets/custom_text_field.dart';

@RoutePage()
class EditTablePage extends StatefulWidget {
  final TableEntity tableEntity;

  const EditTablePage({super.key, required this.tableEntity});
  @override
  _EditTablePageState createState() => _EditTablePageState();
}

class _EditTablePageState extends State<EditTablePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();
  String _selectedLocation = 'front';
  String _selectedStatus = 'available';

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.tableEntity.name ?? '';
    _guestNumberController.text = widget.tableEntity.guestNumber.toString();
    _selectedLocation = widget.tableEntity.location ?? 'front';
    _selectedStatus = widget.tableEntity.status ?? 'available';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Table")),
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
                decoration: const InputDecoration(labelText: "Location"),
                items: ["front", "inside", "outside"]
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
                decoration: const InputDecoration(labelText: "Status"),
                items: ["pending", "available", "unavailable"]
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
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<TablesBloc>(context).add(UpdateTableEvent(
                        request: CreateTableRequest(
                      id: widget.tableEntity.id.toString(),
                      name: _nameController.text,
                      guestNumber: int.parse(_guestNumberController.text),
                      status: _selectedStatus,
                      location: _selectedLocation,
                    )));
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
