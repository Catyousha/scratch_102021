import 'package:flutter/material.dart';

class PrimaryDateInput extends StatelessWidget {
  const PrimaryDateInput({
    Key? key,
    required this.label,
    required this.dateText,
    this.initialDate,
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final String? dateText;
  final DateTime? initialDate;
  final Function(dynamic) valueSetter;

  void _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1945),
      lastDate: DateTime(2022),
    );
    if (newDate != null) {
      valueSetter(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.indigoAccent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8.0),
                Text(
                  '$dateText',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
