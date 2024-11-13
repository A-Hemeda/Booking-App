import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking_app/constants/colors.dart';
import 'package:hotels_booking_app/data/Filter/models/Filter/Search/HotelImages.dart';
import 'package:hotels_booking_app/presentation/Filter/widgets/hotel_list_view.dart';

import '../../../utils/localfiles.dart';
import '../../Filter/widgets/common_card.dart';


class HotelRoomeList extends StatefulWidget {
  final List<HotelImages> photosList;

  const HotelRoomeList({Key? key, required this.photosList}) : super(key: key);
  @override
  _HotelRoomeListState createState() => _HotelRoomeListState( );
}

class _HotelRoomeListState extends State<HotelRoomeList> {





  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 8, right: 16, left: 16),
        itemCount: widget.photosList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonCard(
              color: MyColors.myWhite,
              radius: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ExtendedImage.network(
                    baseurl+
                    (widget.photosList[index].image)!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}