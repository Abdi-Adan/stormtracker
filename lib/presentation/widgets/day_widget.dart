import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Text(
        'Tuesday',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      title: Icon(
        Icons.wb_sunny_outlined,
        color: Colors.white,
        size: 30,
      ),
      trailing: Text(
        '20℃',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
