import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../busieness_logic/FilterCubit/cubit.dart';
import '../data/Filter/models/Filter/Search/hotel.dart';

class GoogleMapProvider extends ChangeNotifier {
  LatLngBounds? _visibleRegion;
  Size? _visibleScreenSize;
  GoogleMapController? _mapController;
  List<Hotel>? _hotelList = FilterCubit.FilteredHotels.data?.hotelsList;

  List<Hotel> get hotelList => _hotelList!;

  void updateGoogleMapController(GoogleMapController mapController) async {
    _mapController = mapController;
    await _setPositionOnScreen();
    notifyListeners();
  }

  void updateScreenVisibleArea(Size size) {
    _visibleScreenSize = size;
    notifyListeners();
  }

  void updateHotelList(List<Hotel> _list) {
    _hotelList = _list;
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }

  Future _setPositionOnScreen() async {
    if (_mapController != null && _visibleScreenSize != null) {
      print("ttttttttttttt");
      _visibleRegion = await _mapController?.getVisibleRegion();
      if (_visibleRegion != null) {
        print("nnnnnnnnnnnnnn");
        var sSize = _visibleScreenSize;
        var sdl = _visibleRegion!.northeast.latitude -
            _visibleRegion!.southwest.latitude;
        var sdlg = _visibleRegion!.southwest.longitude -
            _visibleRegion!.northeast.longitude;
        if (_mapController != null) {
          print("aaaaaaaaaaaaaaa2");
          print(_hotelList?.length);
          for (var item in _hotelList!
          ) {
            print("eeeeeeeeeeeeeeeeeeeeeee");
            print(item.name);
            if (item.address != null) {
              print("aaaaaaaaaaaaaaa");
              print("hhhhhhhhhhhhhhhhhhhhhhhhhhh");
              var fdl =
                  _visibleRegion!.northeast.latitude - double.parse( item.longitude!);
              var fdlg = _visibleRegion!.southwest.longitude -
                  double.parse( item.longitude!);
              item.screenMapPin = Offset(
                  (fdlg * sSize!.width) / sdlg, (fdl * sSize.height) / sdl);
            }
          }
        }
      }
    }
    else  print("ttttttttttttt2222");
  }
}