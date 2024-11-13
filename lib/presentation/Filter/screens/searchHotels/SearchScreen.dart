import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/presentation/Filter/widgets/myfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking_app/presentation/Filter/widgets/searchField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../widgets/NoHotelsFound.dart';
import '../../widgets/hotelCardItem.dart';

class searchScreen extends StatefulWidget {
  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
print("from init");



  }




  @override
  Widget build(BuildContext context) {

    String baseurl="http://api.mahmoudtaha.com/images/";
    var formKey=GlobalKey<FormState>();
    late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //
      //   title: Text("Search",style: TextStyle(color: Colors.black),),
      //
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                       FilterCubit.getpref();
                        BlocProvider.of<FilterCubit>(context).searchcontroller.clear();
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(height: 20,),
                  Text("Search",style: TextStyle(color: Colors.black,
                      fontSize: 20
                      ,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),

                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: SearchField(
                        controller:  BlocProvider.of<FilterCubit>(context).searchcontroller,
                        onchanged: (searchedhotels){
                          //BlocProvider.of<FilterCubit>(context).searchedfunc(searchedhotels);
},
                        hintText: "Search Hotels",
                        prefixIcon:  Icon(Icons.search)),
                  ),
                  Expanded(
                    child: MaterialButton(
                      height: 45,
                      shape: CircleBorder(),
                      //padding: EdgeInsets.all(24),

                      color: Colors.green,
                      onPressed: () {
                        BlocProvider.of<FilterCubit>(context).searchedfunc(BlocProvider.of<FilterCubit>(context).searchcontroller.text);
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

                   SizedBox(height: 15,),
                   Text("Last Searches",style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 15,),


    BlocBuilder<FilterCubit,Filterstates>(
    builder:(context,state) {
      return
        ConditionalBuilder(
            condition: (BlocProvider
                .of<FilterCubit>(context)
                .searchcontroller
                .text
                .isNotEmpty
                || FilterCubit.lastsearches?.isNotEmpty == true
            ),
            builder: (BuildContext context) {
              print("builderrrrrrr");


              if (FilterCubit.searchedhotels.data?.hotelsList?.isNotEmpty ==
                  true) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    //padding: EdgeInsets.all(8),
                    itemCount: FilterCubit.searchedhotels.data?.hotelsList
                        ?.length,
                    itemBuilder: (BuildContext cxt, int index) {
                      return HotelCardItem(
                        hotel:
                        (FilterCubit.searchedhotels.data?.hotelsList![index])!,


                      );
                    });
              } else {
                return NoHotelsFound(message: 'No Hotels Found',
                  image: "assets/images/hotel.svg",);
              }
            },
            fallback: (BuildContext context) {
              return
                Container();
            }

        );


    })
                ],


              ),
          )



          ),
        ),

      
      
    );
  }
}
