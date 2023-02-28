import 'package:flutter/material.dart';
import 'package:stormtracker/utils/app_strings.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Nairobi ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {},
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
