import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../busieness_logic/FilterCubit/cubit.dart';
import '../busieness_logic/FilterCubit/states.dart';
import '../data/Filter/models/Filter/Search/hotel.dart';
import '../helpers/location_helper.dart';
import '../injection/injection.dart';
import '../presentation/Filter/screens/explore/map_hotel_view.dart';
import '../presentation/Filter/screens/map/google_map_ui_view.dart';

class MapAndListView extends StatefulWidget {
  final List<Hotel> hotelList;


  const MapAndListView(
      {Key? key, required this.hotelList})
      : super(key: key);

  @override
  State<MapAndListView> createState() => _MapAndListViewState();
}

class _MapAndListViewState extends State<MapAndListView> {
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;
  Set<Marker> markers = Set();
  // late PlaceSuggestion placeSuggestion;
  // late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;




  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers:  getIt<FilterCubit>().markers,
      initialCameraPosition:FilterCubit.myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        getIt<FilterCubit>().mapController.complete(controller);
      },
      // polylines: placeDirections != null
      //     ? {
      //   Polyline(
      //     polylineId: const PolylineId('my_polyline'),
      //     color: Colors.black,
      //     width: 2,
      //     points: polylinePoints,
      //   ),
      // }
      //     : {},
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt<FilterCubit>(). getMyCurrentLocation();
  }
  // Future<void> getMyCurrentLocation() async {
  //   position = await LocationHelper.getCurrentLocation().whenComplete(() {
  //     setState(() {});
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FilterCubit, Filterstates>(
        builder: (context, state) {
          return Column(
            children: <Widget>[

              Expanded(
                child: Stack(
                  children: <Widget>[
                    FilterCubit.position!=null?
                    buildMap():Center(
          child: Container(
          child: const CircularProgressIndicator(
          color: Colors.blue,
          ))),
                    IgnorePointer(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(1.0),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.4),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 156,
                        // color: Colors.green,
                        child: ListView.builder(
                          itemCount: widget.hotelList.length,
                          padding:
                          EdgeInsets.only(top: 8, bottom: 8, right: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MapHotelListView(
                              callback: () {

                                // NavigationServices(context)
                                //     .gotoRoomBookingScreen(
                                //     hotelList[index].titleTxt);
                              },
                              hotelData: widget.hotelList[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}