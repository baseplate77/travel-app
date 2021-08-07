import 'package:flutter/material.dart';
import 'package:tourve/core/navigation.dart';
import 'package:tourve/core/ui_helper.dart';
import 'package:tourve/model/trip.dart';

import '../../trip_screen/trip_screen.dart';

class NormalCard extends StatelessWidget {
  const NormalCard({
    Key? key,
    required this.isCountry,
    required this.trip,
    this.isTextWhite = false,
  }) : super(key: key);

  final Trip trip;
  final bool isCountry;
  final bool isTextWhite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(context, TripScreen(trip: trip));
      },
      child: SizedBox(
        width: rw(254),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: trip.title,
              child: Container(
                width: rw(254),
                height: rh(147),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(trip.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // SizedBox(height: rh(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  trip.title,
                  style: TextStyle(
                    fontSize: rf(14),
                    color: isTextWhite ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  trip.duration,
                  style: TextStyle(
                    fontSize: rf(10),
                    color: isTextWhite ? Colors.white : Colors.black,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (isCountry) Container() else const Spacer(),
            // SizedBox(height: rh(5)),
            if (isCountry)
              Container()
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    trip.destination,
                    style: TextStyle(
                      fontSize: rf(10),
                    ),
                  ),
                  Text(
                    trip.price,
                    style: TextStyle(
                      fontSize: rf(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
