import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:math' as math;
import '../../../constants/strings.dart';
import '../../../data/Filter/models/Filter/Search/hotel.dart';
import '../../../injection/injection.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/themes.dart';
import '../../Booking/screens/booking_screen.dart';
import 'common_card.dart';

String baseurl = "http://api.mahmoudtaha.com/images/";

class HotelCardItem extends StatelessWidget {
  HotelCardItem({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;
//  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return 
     CommonCard(
          color: AppTheme.scaffoldBackgroundColor,
          radius: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: AspectRatio(
              aspectRatio: 3.0,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 0.90,
                        child: ExtendedImage.network(
                          baseurl +
                              (hotel
                                  .hotelImages![math.Random()
                                      .nextInt((hotel.hotelImages)!.length)]
                                  .image)!,
                          cache: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                hotel.name!,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 12,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Expanded(
                                    child: Text(
                                      hotel.address!,
                                      // maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyles(context)
                                          .getDescriptionStyle()
                                          .copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                  // Text(
                                  //   AppLocalizations(context)
                                  //       .of("km_to_city"),
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyles(context)
                                  //       .getDescriptionStyle()
                                  //       .copyWith(
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              hotel.rate!,
                                              style:
                                                  TextStyle(color: Colors.amber),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4),
                                          child:
                                          RatingBarIndicator(
                                            rating: double.parse(hotel.rate!),
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 10,
                                            itemSize: 13.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "\$${hotel.price}",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          "per_night",
                                          style: TextStyles(context)
                                              .getDescriptionStyle()
                                              .copyWith(
                                                fontSize: 9,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HotelDetailes(hotelData: hotel),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
     }
  }

