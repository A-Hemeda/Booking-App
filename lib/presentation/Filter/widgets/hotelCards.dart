// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
//
// class HotelCards extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  ConditionalBuilder(
//         condition:  BlocProvider.of<FilterCubit>(context).searchcontroller.text.isNotEmpty,
//         builder: (BuildContext context) {
//           if((state).searchedHotels.data?.hotelsList?.isNotEmpty==true) {
//             return ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.all(8),
//                 itemCount:  (state).searchedHotels.data?.hotelsList?.length,
//                 itemBuilder: (BuildContext cxt, int index) {
//                   return HotelCardItem(
//                     hotel:
//                     ( (state).searchedHotels.data?.hotelsList![index])!,
//
//
//
//                   );
//
//                 });
//           } else {
//             return   Center(
//
//               child: Center(
//                 child: Container(
//                   padding: EdgeInsets.only(top: 100),
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width / 1.7,
//                   child: Column(
//                     children: [
//                       SvgPicture.asset(
//
//                         "assets/images/hotel.svg"
//                         , fit:BoxFit.cover,
//                         height: 200,
//
//                       ),
//                       SizedBox(height: 15),
//                       Column(
//                         children: const <Widget>[
//                           Text(
//                             'No Hotels Found',
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.grey),
//                           ),
//                           SizedBox(height: 15),
//                           // Text(
//                           //   'You have no tasks to do.',
//                           //   style: TextStyle(
//                           //       fontSize: 17,
//                           //       fontWeight: FontWeight.w400,
//                           //       color: Colors.grey,
//                           //       fontFamily: 'opensans'),
//                           //   textAlign: TextAlign.center,
//                           // ),
//                         ],
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//
//           //           ListView.builder(
//           //     shrinkWrap: true,
//           //     physics: NeverScrollableScrollPhysics(),
//           //     padding: EdgeInsets.all(8),
//           //     itemCount:  BlocProvider.of<FilterCubit>(context).searchedhotels.data?.hotelsList?.length,
//           //     itemBuilder: (BuildContext cxt, int index)
//           //     {
//           //       return Container(
//           //         height: 50,
//           //         child:
//           //
//           //         Center(child: Text((BlocProvider.of<FilterCubit>(context).searchedhotels.data?.hotelsList![index].name)!)),
//           //       );
//           //     }
//           //
//           // );
//
//         },
//         fallback:(BuildContext context) { return
//           Container();}
//
//     );
//   }
// }
