import 'package:flutter/material.dart';
import 'package:stormtracker/presentation/widgets/custom_appbar.dart';

class CurrentForecast extends StatefulWidget {
  const CurrentForecast({
    super.key,
  });

  @override
  State<CurrentForecast> createState() => _CurrentForecastState();
}

class _CurrentForecastState extends State<CurrentForecast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height * 0.40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.orangeAccent, Colors.deepOrange],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const CustomAppbar(),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.sunny,
                    size: 100,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '25℃',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'SUNNY',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
