import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/weather/weather_bloc.dart';
import 'package:stormtracker/blocs/weather/weather_event.dart';
import 'package:stormtracker/utils/app_strings.dart';

class CustomAppbar extends StatefulWidget {
  final String cityName;
  final bool isFavourited;

  const CustomAppbar({
    super.key,
    required this.cityName,
    required this.isFavourited,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    var isFavourite = widget.isFavourited;
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                //Should show list of favourite cities
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _showDialog(context, '', weatherBloc);
                });
              },
              child: Text(
                widget.cityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    _showDialog(context, '', weatherBloc);
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isFavourite = !isFavourite;
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: isFavourite
                              ? const Text(favouritedLocation)
                              : const Text(unfavouritedLocation),
                          action: SnackBarAction(
                            label: 'Okay',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                )),
          ],
        )
      ],
    );
  }
}

void _showDialog(BuildContext ctx, String cityValue, WeatherBloc weatherBloc) {
  showDialog(
      context: ctx,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: AlertDialog(
            title: const Text('Select new weather location'),
            content: SelectState(
              onCountryChanged: (value) {},
              onStateChanged: (value) {},
              onCityChanged: (value) {
                cityValue = value;
              },
            ),
            actions: [
              TextButton(
                child: const Text('Search'),
                onPressed: () {
                  weatherBloc.add(FetchWeatherEvent(cityValue));
                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        );
      });
}
