import 'package:flutter/material.dart';

class LightHouse extends StatelessWidget {
  const LightHouse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 230,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lighthouse.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
