import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../../busieness_logic/FilterCubit/states.dart';
import '../../../../helpers/location_helper.dart';
import '../../widgets/common_search_bar.dart';
import '../../widgets/hotelCardItem.dart';
import '../../widgets/searchField.dart';
import '../Filteration/FilterationScreen.dart';
import '../../widgets/NoHotelsFound.dart';
import '../searchHotels/SearchScreen.dart';

class explore_screen extends StatefulWidget {
  @override
  State<explore_screen> createState() => _explore_screenState();
}

class _explore_screenState extends State<explore_screen> {
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;
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

  // these variables for getPlaceLocation
  Set<Marker> markers = Set();
  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers: markers,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
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
    getMyCurrentLocation();
   // BlocProvider.of<FilterCubit>(context).getAllhotels();
  }
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                //width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          BlocBuilder<FilterCubit,Filterstates>(
                              builder: (context, state) {
                                if (FilterCubit.isShowMap == false) {
                                  return IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: Icon(

                                      Icons.map_outlined), onPressed: () {
                                    FilterCubit.get(context).showMap(true);
                                  },);
                                }
                                else {
                                  return IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: const Icon(
                                      Icons.format_list_bulleted_outlined),
                                    onPressed: () {
                                      FilterCubit.get(context).showMap(false);
                                    },
                                  );
                                }
                              } )

                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child:
                            SearchField(
                              isenabled: false,
                                // controller:
                                //     BlocProvider.of<FilterCubit>(context)
                                //         .searchcontroller,
                                onchanged: (searchedhotels) {
                                  // BlocProvider.of<FilterCubit>(context)
                                  //     .searchedfunc(searchedhotels);
                                },
                                hintText: "Search Hotels",
                                prefixIcon: Icon(Icons.search)),
                            // CommonSearchBar(
                            //   iconData: FontAwesomeIcons.search,
                            //   enabled: false,
                            //   text: "Search Hotels",
                            // height: 50,
                            // ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              height: 45,
                              shape: CircleBorder(),
                              //padding: EdgeInsets.all(24),

                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => searchScreen()),
                                );
                              },
                              child: Center(
                                  child: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterationScreen()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Filter"),
                            Icon(
                              Icons.filter_list_alt,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<FilterCubit, Filterstates>(
                          builder: (context, state) {
                             if (FilterCubit
                                 .FilteredHotels
                                 .data
                                 ?.hotelsList
                                 ?.isNotEmpty==true)
                             {
                               return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(8),
                            itemCount: FilterCubit
                                .FilteredHotels
                                .data
                                ?.hotelsList
                                ?.length,
                            itemBuilder: (BuildContext cxt, int index) {
                              return HotelCardItem(
                                hotel: (FilterCubit
                                    .FilteredHotels
                                    .data
                                    ?.hotelsList![index])!,
                              );
                            });
                             } else return NoHotelsFound(message:'No Hotels Found',image: "assets/images/hotel.svg",);
                      })
                         // buildMap(),
                    ])))));
  }
}
