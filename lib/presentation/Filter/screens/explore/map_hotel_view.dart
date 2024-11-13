import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotels_booking_app/helpers/location_helper.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../../data/Filter/models/Filter/Search/hotel.dart';
import 'dart:math' as math;
import '../../../../injection/injection.dart';
import '../../../../utils/text_styles.dart';
import '../../../../utils/themes.dart';
import '../../widgets/common_card.dart';
import '../../widgets/hotelCardItem.dart';

class MapHotelListView extends StatefulWidget {
  final VoidCallback callback;
  final Hotel hotelData;

  MapHotelListView(
      {Key? key, required this.hotelData, required this.callback})
      : super(key: key);

  @override
  State<MapHotelListView> createState() => _MapHotelListViewState();
}

class _MapHotelListViewState extends State<MapHotelListView> {
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;

  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  Set<Marker> markers = Set();

  void buildCameraNewPosition() {
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        double.parse(widget.hotelData.latitude!),
        double.parse(widget.hotelData.longitude!),
      ),
      zoom: 13,
    );
  }
  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId('2'),
      onTap: () {},
      infoWindow: InfoWindow(title: "Your current Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }
  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  Future<void> goToMySearchedForLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlace.target,
      markerId: MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // show time and distance
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(title: "${widget.hotelData.description}"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyCurrentLocation();
  }
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 16),
      child: CommonCard(
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
                      child: Image.network(
                        baseurl+
                            (widget.hotelData
                                .hotelImages![math.Random().nextInt((widget.hotelData.hotelImages)!.length)].image)!,
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
                              widget.hotelData.name!,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style:
                              TextStyle( color: Colors.black,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  size: 12,
                                  color:
                                  Theme.of(context).primaryColor,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.hotelData.address!,
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

                                          Text(widget.hotelData.rate!,style:TextStyle(color: Colors.amber),),
                                          Icon(Icons.star,size: 15,color: Colors.amber,),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child:  RatingBarIndicator(
                                          rating: double.parse(widget.hotelData.rate!),
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
                                        "\$${widget.hotelData.price}",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(color: Colors.black,
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
                    widget.hotelData.isSelected=true;

                      print("helllllllllllo");
                   //   widget.callback();
                     // _goToMyCurrentLocation();
                    getIt<FilterCubit>(). removeAllMarkersAndUpdateUI();
                    getIt<FilterCubit>().isSearchedPlaceMarkerClicked=false;
                    getIt<FilterCubit>().goToMySearchedForLocation(
                      double.parse(widget.hotelData.latitude!),
                        double.parse(widget.hotelData.longitude!),
                        widget.hotelData.address!
                    );

                      //hereeeeeeeeeeeeeeeeeeeeeeeeeee
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}