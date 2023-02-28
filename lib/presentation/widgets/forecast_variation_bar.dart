import 'package:flutter/material.dart';
import 'package:stormtracker/presentation/widgets/forecast_variation_item.dart';

class ForecastVariationBar extends StatelessWidget {
  const ForecastVariationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ForecastVariationItem(),
            ForecastVariationItem(),
            ForecastVariationItem(),
          ],
        ),
        const Divider(color: Colors.white),
      ]),
    );
  }
}
