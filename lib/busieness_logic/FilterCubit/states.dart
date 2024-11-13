

import '../../data/Filter/models/Filter/Get facilities/facilities_model.dart';
import '../../data/Filter/models/Filter/Search/hotelsSearch_model.dart';

abstract class Filterstates {}
class addMarkerToMarkersAndUpdateUIstate extends Filterstates{}
class buildSearchedPlaceMarkerstate extends Filterstates{}
class getMyCurrentLocationstate extends Filterstates{}
class removeAllMarkersAndUpdateUIstate extends Filterstates{}
class initialhotelstate extends Filterstates{}
class PlaceLocationLoaded extends Filterstates{


}
class getAllFacilitiesState extends Filterstates{

  final getFacilities facilities;
  getAllFacilitiesState(this.facilities);


}
class updateFacilityState extends Filterstates{

//List<bool> isswitchedList;
  //updateFacilityState(this.isswitchedList);


}
class updatepricesliderState extends Filterstates{



}
class updateaddressState extends Filterstates{



}
class searchHotelsState extends Filterstates{
  final hotelsSearch searchedHotels ;

  searchHotelsState(this.searchedHotels);


}
class getAllHotelsState extends Filterstates{}
class getFilterdHotelsState extends Filterstates{}
class ShowMapState extends Filterstates{}