import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../data/Filter/models/Filter/Search/hotel.dart';
import '../../../../helpers/location_helper.dart';
import '../../../../providers/google_map_provider.dart';
import '../../../../utils/themes.dart';

class GoogleMapUIView extends StatefulWidget {
  final List<Hotel> hotelList;
  const GoogleMapUIView({Key? key, required this.hotelList}) : super(key: key);

  @override
  _GoogleMapUIViewState createState() => _GoogleMapUIViewState();
}

class _GoogleMapUIViewState extends State<GoogleMapUIView> {
 // Set<Marker> markers = Set();
  GoogleMapController? _mapController;
  GoogleMapProvider _googleMapProvider = GoogleMapProvider();
  static Position? position;
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
 // Completer<GoogleMapController> _mapController = Completer();
  @override
  void initState() {
   // _googleMapProvider.updateHotelList(widget.hotelList);
    super.initState();
   // getMyCurrentLocation();
  }
  Future<void> getMyCurrentLocation() async {
    // position = await LocationHelper.getCurrentLocation().whenComplete(() {
    //   setState(() {});
    // });
   // _goToMyCurrentLocation();
  }

  // Future<void> _goToMyCurrentLocation() async {
  //   final GoogleMapController controller = await _mapController.future;
  //   controller.animateCamera(
  //       CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  // }
  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _googleMapProvider.updateScreenVisibleArea(
            Size(constraints.maxWidth, constraints.maxHeight));
        return ChangeNotifierProvider(
            create: (context) => _googleMapProvider,
            builder: (context, provider) {
              return Stack(
                children: [
                  Container(),
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(51.507896, -0.128006),
                      zoom: 13,
                    ),
                    mapType: MapType.normal,
                    onCameraMove: (CameraPosition position) {
                      if (_mapController != null)
                        _googleMapProvider
                            .updateGoogleMapController(_mapController!);
                    },
                    mapToolbarEnabled: false,
                    compassEnabled: false,
                    myLocationButtonEnabled: false,
                    rotateGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) async {
                      print("llllllllllllllllll");
                      _mapController = controller;
                      await _mapController?.setMapStyle(
                        await DefaultAssetBundle.of(context).loadString(
                          "assets/json/mapstyle_light.json"

                        ),
                      );
                      _googleMapProvider.updateGoogleMapController(controller);
                    },
                  ),
              // GoogleMap(
              // mapType: MapType.normal,
              // myLocationEnabled: true,
              // zoomControlsEnabled: false,
              // myLocationButtonEnabled: false,
              // markers: markers,
              // initialCameraPosition: _myCurrentLocationCameraPosition,
              // onMapCreated: (GoogleMapController controller) {
              // _mapController.complete(controller);
              // },),
                  for (var item in context.watch<GoogleMapProvider>().hotelList)
                    item.screenMapPin != null
                        ? AnimatedPositioned(
                      duration: Duration(milliseconds: 1),
                      top: item.screenMapPin!.dy - 48,
                      left: item.screenMapPin!.dx - 40,
                      child: SizedBox(
                        height: 48,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: item.isSelected
                                    ? AppTheme.primaryColor
                                    : AppTheme.backgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(24.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: AppTheme.secondaryTextColor,
                                    blurRadius: 16,
                                    offset: Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    if (item.isSelected == false) {
                                      context
                                          .read<GoogleMapProvider>()
                                          .hotelList
                                          .forEach((f) {
                                        f.isSelected = false;
                                      });
                                      item.isSelected = true;
                                    }
                                    _googleMapProvider.updateUI();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 4,
                                        bottom: 4),
                                    child: Text(
                                      "\$${item.price}",
                                      style: TextStyle(
                                          color: item.isSelected
                                              ? AppTheme.backgroundColor
                                              : AppTheme.primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IgnorePointer(
                              child: Container(
                                width: 1,
                                color: item.isSelected
                                    ? AppTheme.primaryColor
                                    : AppTheme.backgroundColor,
                                height: 13,
                              ),
                            ),
                            IgnorePointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                width: 4,
                                height: 4,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                        : SizedBox(),
                ],
              );
            });
      },
    );
  }
}