import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  final String dayOfWeek;
  final IconData statusIcon;
  final String dayTemp;

  const DayWidget({
    super.key,
    required this.dayOfWeek,
    required this.statusIcon,
    required this.dayTemp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        DateFormat('EEEE').format(DateTime.parse(dayOfWeek)),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      title: Icon(
        statusIcon,
        color: Colors.white,
        size: 30,
      ),
      trailing: Text(
        '$dayTemp ℃',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
