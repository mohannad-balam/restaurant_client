import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reservation_client/core/common/widgets/custom_text_field.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/utils/helpers/helpers.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';

import '../../../core/services/injectables/locator.dart';
import '../../../core/services/localDB/local_db_service.dart';


@RoutePage()
class CreateReservationPage extends StatefulWidget {
  const CreateReservationPage({super.key});

  @override
  State<CreateReservationPage> createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _guestNumberController = TextEditingController();

  // Dropdown and DatePicker variables
  // ignore: unused_field
  int? _selectedTableId;
  DateTime? _reservationDate;

  @override
  void initState(){
    _nameController.text = locator<LocalDBService>().getUserInfo()?.name ?? '';
    _emailController.text = locator<LocalDBService>().getUserInfo()?.email ?? '';
    BlocProvider.of<TablesBloc>(context).add(
      GetAvailableTablesEvent()
    );
    super.initState();
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();

    // Pick Date
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 7)),
    );

    if (date == null) return; // Cancelled

    // Pick Time
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return; // Cancelled

    setState(() {
      _reservationDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Name
                CustomTextField(
                  enabled: false,
                  label: 'Name',
                  controller: _nameController,
                  icon: Icons.person,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(20)
                  ]),
                ),
                const SizedBox(height: 16),
                // Email
                CustomTextField(
                  enabled: false,
                  label: 'email',
                  controller: _emailController,
                  icon: Icons.email,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(20)
                  ]),
                ),
                const SizedBox(height: 16),
                // Phone Number
                CustomTextField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  icon: Icons.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber()
                  ]),
                ),
                const SizedBox(height: 16),
                // Guest Number
                CustomTextField(
                  label: 'Guest Number',
                  controller: _guestNumberController,
                  icon: Icons.people,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.positiveNumber(),
                    FormBuilderValidators.max(8),
                  ]),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                // Reservation Date Picker
                TextButton.icon(
                  onPressed: () => _pickDateTime(context),
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    _reservationDate == null
                        ? 'Select Reservation Date'
                        : 'Selected Date: ${HelpUtils.format_Y_M_D_containing_hours(_reservationDate!)}',
                        style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 16),
                // Table Dropdown
                BlocBuilder<TablesBloc, TablesState>(
                  builder: (context, state) {
                    if(state is TablesLoaded){
                      return DropdownButtonFormField<TableEntity>(
                  style: theme.textTheme.bodyLarge,
                  decoration: const InputDecoration(
                    labelText: 'Select Table',
                    border: OutlineInputBorder(),
                  ),
                  value: state.tables.first,
                  items: state.tables
                      .map((table) => DropdownMenuItem(
                            value: table,
                            child: Text("${table.name.toString()} (${table.guestNumber.toString()} guests) (${table.location.toString()})"),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      print("selected table id => ${value?.id}");
                      _selectedTableId = value?.id;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a table';
                    }
                    return null;
                  },
                );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 24),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: MainButton(title: 'Submit Reservation', onPressed: (){
                    BlocProvider.of<ReservationBloc>(context).add(
                      CreateReservationEvent(reservationRequest: ReservationRequest(
                        firstName: _nameController.text,
                        lastName: _nameController.text,
                        email: _emailController.text,
                        telNumber: _phoneController.text,
                        guestNumber: int.parse(_guestNumberController.text),
                        resDate: HelpUtils.format_Y_M_D_containing_hours(_reservationDate!),
                        tableId: _selectedTableId,
                      ))
                    );
                  }, borderStyle: false)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
