import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';

import 'package:hotels_booking_app/presentation/Filter/screens/searchHotels/SearchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Filter/models/Filter/Get facilities/facilities_model.dart';
import '../../data/Filter/models/Filter/Search/hotelsSearch_model.dart';
import '../../data/Filter/repository/FilterRepo/repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../helpers/location_helper.dart';
class FilterCubit extends Cubit<Filterstates> {
  SfRangeValues pricevalues = SfRangeValues(0.0, 6000);
 SharedPreferences? prefs;
  FilterCubit(this.myrepo) : super(initialhotelstate());
  static FilterCubit get(context) => BlocProvider.of(context);
  static bool isShowMap=false;
  late GoogleMapController controller;
  final searchcontroller=TextEditingController();
   List<bool> isswitchedlist=[];
 hotelsSearch allHotels=new hotelsSearch();
  static hotelsSearch FilteredHotels=new hotelsSearch();
  List adresses=['Not selected','Sahl Hasheesh','Intercontinental district',"Safaga Road","El Dahar",];
  String selectedAdresse='Not selected';
  static hotelsSearch searchedhotels=new hotelsSearch();
  MyRepo myrepo;
  getFacilities? facilities;
  static String? lastsearches=null;
  static late Marker searchedPlaceMarker;
  static late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;
  static Position? position;

  Completer<GoogleMapController> mapController = Completer();
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  Set<Marker> markers = Set();
  void removeAllMarkersAndUpdateUI() {
print("koko");
      markers.clear();
    emit(removeAllMarkersAndUpdateUIstate());
  }
  void buildCameraNewPosition(double lat , double long) {

    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        lat,
       long,
      ),
      zoom: 13,
    );
    print("finall");
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

      markers.add(marker);
     emit(addMarkerToMarkersAndUpdateUIstate()) ;

  }


  static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  Future<void> goToMySearchedForLocation(double lat , double lng,String descp) async {
    markers.clear();
    print("koky");
    print("hiiiiiiiiiiiiiii23");
    print(descp);
    isSearchedPlaceMarkerClicked=false;
    removeAllMarkersAndUpdateUI();
    print(isSearchedPlaceMarkerClicked);
    print("hereeeeeeeeee");
       print("$lat,$lng");
    buildCameraNewPosition(lat,lng);
    mapController.future.then((value)  {
      controller=value;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace)).then((vall){
        buildCurrentLocationMarker();
        buildSearchedPlaceMarker(descp);
      });
    });



  }

  void buildSearchedPlaceMarker(String descp) {
    print("hiiiiiiiiiiiiiii23");
    print(descp);
    markers.clear();
  //  isSearchedPlaceMarkerClicked = true;
   // emit(buildSearchedPlaceMarkerstate());
    searchedPlaceMarker = Marker(

      position: goToSearchedForPlace.target,
      markerId: MarkerId('1'),
      onTap: () {
        print(goToSearchedForPlace.target);
        print("hiiiiiiiiiiiiiii");
        print(isSearchedPlaceMarkerClicked);
        isSearchedPlaceMarkerClicked = false;

       // emit(buildSearchedPlaceMarkerstate());
        print(isSearchedPlaceMarkerClicked);
        buildCurrentLocationMarker();
        // show time and distance
  //emit(buildSearchedPlaceMarkerstate());

        print("hiiiiiiiiiiiiiii22");
        print(descp);
       // emit(buildSearchedPlaceMarkerstate());
      },

      infoWindow: InfoWindow(title:

      isSearchedPlaceMarkerClicked==false?
      "${descp}":""
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    emit(buildSearchedPlaceMarkerstate());
    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
     emit(getMyCurrentLocationstate());
    });
  }
  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
  }
  static savepref(String lastsearches)async{
    print("from savepref2");
    SharedPreferences prefs= await SharedPreferences.getInstance();
    
       prefs.setString("lastSearched", lastsearches);
       print("from savepref");
       print(prefs.get("lastSearched"));
     

 

  }
  static getpref()async{


       SharedPreferences prefs= await SharedPreferences.getInstance();
    lastsearches=prefs.getString("lastSearched");
    if( lastsearches!=null)
    {
     searchedhotels= hotelsSearch.fromJson(jsonDecode( lastsearches!));
     print("from getpref");
     print(lastsearches?.isNotEmpty.toString());
     print(searchedhotels.data?.hotelsList?.length);
    }

  }
 void getAllhotels(){
myrepo.getAllHotels().then((value) {
      allHotels=value;
      FilteredHotels=value;

      emit(getAllHotelsState());

});


 }
 void getSelectedPlaceLocation(){

    emit(PlaceLocationLoaded());

 }
 void loadSharedpref(String lastsearched)
 {
 // searchedhotels= lastsearched;
 }
 void gethotelsbyFilter({List<int?>? facs,var pricevalues=null , String? selectedcity}){
 if(selectedcity=="Not selected") {
   selectedcity=null;
 }
if(facs?.isEmpty==true)
  emitGetsearchedHotels(maxprice: pricevalues.end,
      minprice: pricevalues.start,address: selectedcity );
  else {

  emitGetsearchedHotels(maxprice: pricevalues.end,
      minprice: pricevalues.start,address: selectedcity,facilities1: facs );
}


 }
  void searchedfunc(var searchedHotel) {
    if (searchcontroller.text.isNotEmpty) {
    print("from search");
    print(searchcontroller.text);
    print(searchedHotel);

    myrepo.searchHotels(name: searchedHotel).then((searchedHotels) {
      searchedhotels = searchedHotels;
      print("jjjllllllllllllll");

        savepref(jsonEncode(searchedHotels));

      print(searchedhotels.data?.hotelsList?.length);
      emit(searchHotelsState(searchedhotels));
    }
    );
  }
  }

  void emitGetAllFacilities()
  {
    myrepo.getAllFacilities().then((facilitiess) {
     facilities=facilitiess;
      int? size=facilities?.data?.length;
     isswitchedlist = List<bool>.filled((size)!, false, growable: true);
      emit(getAllFacilitiesState(facilities!));
      
      
    });


  }
  void onOroffFacility (int index,bool value)
  {
    isswitchedlist[index]=value;
    emit(updateFacilityState());
  }
  void updatepriceslider (SfRangeValues values)
  {
   pricevalues=values;
    emit(updatepricesliderState());
  }
  void updateaddress (String selected)
  {
   selectedAdresse=selected;
    emit(updateaddressState());
  }
  void showMap(bool isShow)
  {
    isShowMap=isShow;
    emit(ShowMapState());

  }
  void emitGetsearchedHotels(
      {var name=null,
      var address=null,
      var maxprice=null,
      var minprice=null,
      var facilities1,

      var latitude=null,
      var longitude=null,
      var distance=null,
      var count=null,
      var page=null,
}
      )
  {

    myrepo.searchHotels(
     name: name,
      address:address,
      maxprice:maxprice,
      minprice:minprice,
      facilities1:facilities1,

      latitude:latitude,
      longitude:longitude,
      distance:distance,
      count:count,
      page:page,
    ).then((filterdhotels) {


      FilteredHotels=filterdhotels;
      emit(getAllHotelsState());
     // emit(searchHotelsState(searchedhotels));


    });


  }

}