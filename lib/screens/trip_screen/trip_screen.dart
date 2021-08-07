import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../core/ui_helper.dart';
import '../../core/widgets/button/custom_button.dart';
import '../../core/widgets/open_sheet/open_bottom_sheet.dart';
import '../../model/trip.dart';
import '../done_screen/done_screen.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final Trip trip;

  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  Future<void> openBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      enableDrag: true,
      builder: (context) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.trip.title,
                  child: Container(
                    width: double.infinity,
                    height: rh(472),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.trip.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.4),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: rh(20.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.trip.title.toUpperCase(),
                            style: kLargeTitle.copyWith(
                              letterSpacing: 8,
                              fontWeight: FontWeight.w900,
                              fontSize: rf(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: rh(50),
                  left: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: rh(20)),
                  // List Tile
                  CustomListTile(trip: widget.trip),

                  SizedBox(height: rh(30)),

                  Text(
                    'Experiences',
                    style: TextStyle(
                      fontSize: rf(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: rh(10)),

                  Text(
                    widget.trip.experiences ?? "Something Dummy Text",
                    style: TextStyle(
                      fontSize: rf(12),
                      height: rh(1.3),

                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: rh(30)),

                  CustomButton.expanded(
                    context: context,
                    text: 'Book now',
                    onPressed: () {
                      openBottomSheet(
                        context: context,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15.0,
                            top: 15,
                            bottom: 50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: rf(16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: rh(20)),
                              CustomListTile(
                                trip: widget.trip,
                                showTitle: true,
                              ),
                              SizedBox(height: rh(30)),
                              CustomButton.expanded(
                                context: context,
                                text: 'Confirm',
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const DoneScreen(),
                                  ));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: rh(50)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.trip,
    this.showTitle = false,
  }) : super(key: key);

  final Trip trip;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showTitle ? trip.title : trip.destination,
              style: kQuoteStyle.copyWith(
                fontSize: showTitle ? rf(18) : rf(14),
                color: Colors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            SizedBox(height: rh(5)),
            Text(
              trip.extraDuration ?? "",
              style: kQuoteStyle.copyWith(
                fontSize: rf(12),
                color: Colors.black,
                // fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
          ],
        ),

        //Pricw
        Text(
          trip.price,
          style: kQuoteStyle.copyWith(
            fontSize: rf(24),
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
