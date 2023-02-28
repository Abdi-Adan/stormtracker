import 'package:flutter/material.dart';

class WavesPattern extends StatelessWidget {
  const WavesPattern({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 2,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 2, left: 35),
          width: 60,
          height: 2,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 2, left: 10),
          width: 60,
          height: 2,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
        ),
      ],
    );
  }
}
