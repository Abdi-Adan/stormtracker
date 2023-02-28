
import 'package:flutter/material.dart';

class ForecastVariationItem extends StatelessWidget {
  const ForecastVariationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          Text(
            '19℃',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'min',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
