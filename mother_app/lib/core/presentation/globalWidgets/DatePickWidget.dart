import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  // Variable to store the selected date string/object
  String _selectedDate = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Date Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The Date Picker Widget
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: DateTime.now(),
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Date: $_selectedDate',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
