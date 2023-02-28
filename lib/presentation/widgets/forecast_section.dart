import 'package:flutter/material.dart';
import 'package:stormtracker/presentation/widgets/day_widget.dart';
import 'package:stormtracker/presentation/widgets/forecast_variation_bar.dart';
import 'package:stormtracker/presentation/widgets/waves_pattern.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff4a90e2),
      height: (MediaQuery.of(context).size.height * 0.60),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const WavesPattern(),
          const SizedBox(height: 25),
          const ForecastVariationBar(),
          SingleChildScrollView(
            child: Column(
              children: const [
                DayWidget(),
                DayWidget(),
                DayWidget(),
                DayWidget(),
                DayWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
