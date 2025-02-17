import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_client/core/common/widgets/custom_text_field.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/constant/asset_files.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/core/utils/helpers/helpers.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';

import '../../../data/models/request/reservation/reservation_request.dart';

@RoutePage()
class EditReservationPage extends StatefulWidget {
  final ReservationEntity reservation;

  const EditReservationPage({super.key, required this.reservation});

  @override
  State<EditReservationPage> createState() => _EditReservationPageState();
}

class _EditReservationPageState extends State<EditReservationPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _guestNumberController;

  int? _selectedTableId;
  DateTime? _reservationDate;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.reservation.firstName);
    _emailController = TextEditingController(text: widget.reservation.email);
    _phoneController =
        TextEditingController(text: widget.reservation.telNumber);
    _guestNumberController =
        TextEditingController(text: widget.reservation.guestNumber.toString());
    _reservationDate = DateTime.parse(widget.reservation.resDate!);
    _selectedTableId = widget.reservation.tableId;
    BlocProvider.of<TablesBloc>(context).add(GetAvailableTablesEvent());
    super.initState();
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final initialDate = _reservationDate ?? now;

    // Ensure initialDate is not before firstDate
    final correctedInitialDate = initialDate.isBefore(now) ? now : initialDate;

    // Pick Date
    final date = await showDatePicker(
      context: context,
      initialDate: correctedInitialDate,
      firstDate: now,
      lastDate: now.add(
          const Duration(days: 365)), // Allow reservations up to a year ahead
    );

    if (date == null) return; // Cancelled

    // Pick Time
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_reservationDate ?? now),
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
      appBar: AppBar(title: const Text(Strings.editReservation)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset(AssetLotties.reservations,
                    repeat: true, animate: true),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Name',
                  controller: _nameController,
                  icon: Icons.person,
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  icon: Icons.email,
                  validator: FormBuilderValidators.email(),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  icon: Icons.phone,
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Guest Number',
                  controller: _guestNumberController,
                  icon: Icons.people,
                  validator: FormBuilderValidators.numeric(),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
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
                BlocBuilder<TablesBloc, TablesState>(
                  builder: (context, state) {
                    if (state is TablesLoaded) {
                      return DropdownButtonFormField<TableEntity>(
                        style: theme.textTheme.bodyLarge,
                        decoration: const InputDecoration(
                          labelText: 'Select Table',
                          border: OutlineInputBorder(),
                        ),
                        value: state.tables.firstWhere(
                          (table) => table.id == _selectedTableId,
                          orElse: () => state.tables.first,
                        ),
                        items: state.tables
                            .map((table) => DropdownMenuItem(
                                  value: table,
                                  child: Text(
                                      "${table.name} (${table.guestNumber} guests) (${table.location})"),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedTableId = value?.id;
                          });
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: MainButton(
                    title: Strings.submit,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<ReservationBloc>(context).add(
                          UpdateReservationEvent(
                            reservationRequest: ReservationRequest(
                              id: widget.reservation.id.toString(),
                              firstName: _nameController.text,
                              lastName: widget.reservation.lastName,
                              email: _emailController.text,
                              telNumber: _phoneController.text,
                              guestNumber:
                                  int.parse(_guestNumberController.text),
                              resDate: HelpUtils.format_Y_M_D_containing_hours(
                                  _reservationDate!),
                              tableId: _selectedTableId,
                            ),
                          ),
                        );
                      }
                    },
                    borderStyle: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
