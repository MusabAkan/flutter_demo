import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeUsing extends StatefulWidget {
  const DatetimeUsing({super.key});

  @override
  State<DatetimeUsing> createState() => _DatetimeUsingState();
}

class _DatetimeUsingState extends State<DatetimeUsing> {
  DateTime _currentDateTime = DateTime.now();
  TimeOfDay _currentHour = TimeOfDay.now();

  _selectDate() async {
    var _current = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialDate: _currentDateTime,
    );
    if (_current != null) {
      setState(() {
        _currentDateTime = _current;
      });
    }
  }

  _selectTime() async {
    var _current = await showTimePicker(
      context: context,
      initialTime: _currentHour,
    );
    if (_current != null) {
      setState(() {
        _currentHour = _current;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _formatDate = DateFormat(
      'dd-MM-yyyy EEEE',
      'tr',
    ).format(_currentDateTime);

    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _selectDate, child: Text("Tarih Seç")),
          Text(_formatDate, style: Theme.of(context).textTheme.displaySmall),
          ElevatedButton(onPressed: _selectTime, child: Text("Saat Seç")),
          Text(
            _currentHour.format(context),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
