import 'package:flutter/material.dart';

class ForecastVariationItem extends StatelessWidget {
  final String temp;

  const ForecastVariationItem({
    super.key, required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '$temp ℃',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
            'min',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
