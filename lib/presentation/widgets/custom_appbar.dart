import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

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
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
