import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../../data/Filter/models/Filter/Search/hotel.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/themes.dart';
import 'common_card.dart';
import 'list_cell_animation_view.dart';
String baseurl="http://api.mahmoudtaha.com/images/";
class HotelListView extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final Hotel hotelData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HotelListView(
      {Key? key,
        required this.hotelData,
        required this.animationController,
        required this.animation,
        required this.callback,
        this.isShowDate: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: Column(
          children: <Widget>[
            isShowDate
                ? Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   Helper.getDateText(hotelData.date!) + ', ',
                  //   style: TextStyles(context)
                  //       .getRegularStyle()
                  //       .copyWith(fontSize: 14),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                     ( hotelData.address!),
                      style: TextStyles(context)
                          .getRegularStyle()
                          .copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
                : SizedBox(),
            CommonCard(
              color: AppTheme.backgroundColor,
              radius: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image.asset(
                            baseurl+
                                (hotelData
                                    .hotelImages![math.Random().nextInt((hotelData.hotelImages)!.length)].image)!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8, right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                       ( hotelData.name!),
                                        textAlign: TextAlign.left,
                                        style: TextStyles(context)
                                            .getBoldStyle()
                                            .copyWith(fontSize: 22),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            hotelData.description!,
                                            style: TextStyles(context)
                                                .getDescriptionStyle(),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: 12,
                                            color:
                                            Theme.of(context).primaryColor,
                                          ),
                                          // Text(
                                          //   "${hotelData.dist.toStringAsFixed(1)}",
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: TextStyles(context)
                                          //       .getDescriptionStyle(),
                                          // ),
                                          // Expanded(
                                          //   child: Text(
                                          //     AppLocalizations(context)
                                          //         .of("km_to_city"),
                                          //     overflow: TextOverflow.ellipsis,
                                          //     style: TextStyles(context)
                                          //         .getDescriptionStyle(),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          children: <Widget>[
                                            RatingBarIndicator(
                                              rating: double.parse(hotelData.rate!),
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 19.0,
                                              direction: Axis.horizontal,
                                            ),
                                            // Text(
                                            //   " ${hotelData.reviews}",
                                            //   style: TextStyles(context)
                                            //       .getDescriptionStyle(),
                                            // ),
                                            // Text(
                                            //   AppLocalizations(context)
                                            //       .of("reviews"),
                                            //   style: TextStyles(context)
                                            //       .getDescriptionStyle(),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, top: 8, left: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "\$${hotelData.price}",
                                    textAlign: TextAlign.left,
                                    style: TextStyles(context)
                                        .getBoldStyle()
                                        .copyWith(fontSize: 22),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Text(
                                     "per_night",
                                      style: TextStyles(context)
                                          .getDescriptionStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          onTap: () {
                            try {
                              callback();
                            } catch (e) {}
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            shape: BoxShape.circle),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}