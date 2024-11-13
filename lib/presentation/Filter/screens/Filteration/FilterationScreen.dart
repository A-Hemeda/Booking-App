import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/cubit.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';


import '../../../../data/Filter/models/Filter/Get facilities/facilities_model.dart';
import '../../../../data/Filter/models/Filter/Search/hotelsSearch_model.dart';


class FilterationScreen extends StatefulWidget {
  @override
  _FilterationScreenState createState() => _FilterationScreenState();
}

class _FilterationScreenState extends State<FilterationScreen> {
getFacilities? allfacilties;
  hotelsSearch? searchedhotels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  BlocProvider.of<FilterCubit>(context).emitGetAllFacilities();
    print("fac[0]");
    allfacilties=BlocProvider.of<FilterCubit>(context).facilities;
   //BlocProvider.of<FilterCubit>(context).emitGetsearchedHotels(facilities1: 3,facilities2: 4);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<FilterCubit,Filterstates>(builder: (context,state){
                  if(allfacilties?.data?.isNotEmpty==true
                  )
                   {



                    return
                      SingleChildScrollView(
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: (){
                                  List<int> choosenFacilities=[];
                                  int i=0;
                                 for( i=0;  i<(allfacilties?.data?.length)!; i++)
                                   {if ( BlocProvider.of<FilterCubit>(context).isswitchedlist[i]==true)
                                   {
                                     choosenFacilities.add((allfacilties?.data![i].id)!);
                                   }
                                   }
                                 print("lllledddd${choosenFacilities.length}");
                                  BlocProvider.of<FilterCubit>(context).gethotelsbyFilter(facs:choosenFacilities,
                                    pricevalues:  BlocProvider.of<FilterCubit>(context).pricevalues,
                                          selectedcity:BlocProvider.of<FilterCubit>(context).selectedAdresse);

                                 // if(choosenFacilities.length==2) {
                                 //   BlocProvider.of<FilterCubit>(context).gethotelsbyFilter(
                                 //       facility1:choosenFacilities[0], facility2:choosenFacilities[1],
                                 //    pricevalues:  BlocProvider.of<FilterCubit>(context).pricevalues,selectedcity: BlocProvider.of<FilterCubit>(context).selectedAdresse);
                                 // }
                                 // else if(choosenFacilities.length==1)
                                 // {
                                 //   BlocProvider.of<FilterCubit>(context).gethotelsbyFilter(
                                 //       facility1:choosenFacilities[0],
                                 //       pricevalues:  BlocProvider.of<FilterCubit>(context).pricevalues,
                                 //       selectedcity:BlocProvider.of<FilterCubit>(context).selectedAdresse);
                                 // }
                                 // else {
                                 //   BlocProvider.of<FilterCubit>(context).gethotelsbyFilter(
                                 //
                                 //       pricevalues:  BlocProvider.of<FilterCubit>(context).pricevalues,
                                 //       selectedcity:BlocProvider.of<FilterCubit>(context).selectedAdresse);
                                 // }
                                 //

                                  Navigator.pop(context);
                                }, icon: Icon(Icons.clear)),
                            SizedBox(height: 20,),
                            Text("Filter",style: const TextStyle(color: Colors.black,
                                fontSize: 20
                                ,fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text("Type of All Facillities",style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 15,),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8),
                                itemCount: (allfacilties?.data?.length)!,
                                itemBuilder:(BuildContext cxt, int index){
                                  return   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text((allfacilties?.data![index].name)!),
                                      Switch(
                                        value: BlocProvider.of<FilterCubit>(context).isswitchedlist[index] ,
                                        onChanged: (value) {

                                          BlocProvider.of<FilterCubit>(context).onOroffFacility(index, value);

                                        },
                                      ),
                                    ],
                                  );


                                }, separatorBuilder: (BuildContext context, int index) {


                                  return Divider();
                            },


                            ),
                           
                            Divider(thickness: 2,),
                            SizedBox(height: 20,),
                            Text("Price",style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 10,),
                            SfRangeSlider(

                              enableIntervalSelection: true,
                              //shouldAlwaysShowTooltip: true,
                              min: 20,
                              max: 8000,

                              values:   BlocProvider.of<FilterCubit>(context).pricevalues,
                              interval: 1500,
                              stepSize: 1,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (SfRangeValues values){

                                  BlocProvider.of<FilterCubit>(context).updatepriceslider(values);

                              },
                            ),
                            SizedBox(height: 10,),
                            Divider(thickness: 2,),
                            SizedBox(height: 20,),
                            // Text("Adresse",style: TextStyle(color: Colors.grey),),
                            // SizedBox(height: 20,),
                            // DropdownButtonFormField(
                            //       decoration:  const InputDecoration(
                            //           isDense: true,
                            //           contentPadding: EdgeInsets.all(8),
                            //           filled: true,
                            //           fillColor: Colors.white,
                            //           hoverColor: Colors.red,
                            //           focusColor: Colors.black,
                            //
                            //           prefixIcon:Icon(Icons.location_on),
                            //           border: OutlineInputBorder(
                            //            // borderSide: BorderSide(color: Colors.white),
                            //            // borderRadius:  BorderRadius.circular(25.7),
                            //
                            //           ),
                            //           hintStyle: TextStyle(color: Colors.grey,fontSize: 13)
                            //
                            //       ),
                            //     items: BlocProvider.of<FilterCubit>(context).adresses.map((e) =>
                            //     DropdownMenuItem(child: Text(e),value: e,)
                            //
                            //     ).toList(),
                            //     value:  BlocProvider.of<FilterCubit>(context).selectedAdresse,
                            //
                            //     onChanged: (vall)
                            //   {
                            //     BlocProvider.of<FilterCubit>(context).updateaddress(vall as String);
                            //
                            //   },
                            //   icon:Icon( Icons.arrow_drop_down,color: Colors.indigoAccent,),
                            //
                            // )

                          ],
                        ),
                      );
                   }


                  else return Center(child: CircularProgressIndicator());



          }),
        ),
      ),


    );
  }
}
