import 'dart:convert';


import '../../models/Filter/Search/hotelsSearch_model.dart';
import '../../web_services/FilterWebsevices/web_services.dart';

import '../../models/Filter/Get facilities/facilities_model.dart';

class MyRepo{
  final webServices WebService;

  MyRepo(this.WebService);
  Future<getFacilities> getAllFacilities()async{

 var response= await WebService.getAllFacilities();
return response;
  }
  Future<hotelsSearch> getAllHotels()async{


    var response= await WebService.getAllHotels();
    print("from alllllll");
    print(response);
    return response;
  }

  Future<hotelsSearch> searchHotels(
  {    var name=null,
  var address=null,
  var maxprice=null,
  var minprice=null,
  var facilities1=null,

  var latitude=null,
  var longitude=null,
  var distance=null,
  var count=null,
  var page=null,}


      )async{

    var response= await WebService.searchHotels(name,address,
      maxprice,minprice,facilities1,
       latitude,longitude,distance,count,page
    );
   // jsonEncode(response);
    return response;

  }

}