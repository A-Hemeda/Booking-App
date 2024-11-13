// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hotels_booking_app/data/models/Filter/Get%20facilities/facilitiesData_model.dart';
//
// class FilterItem extends StatelessWidget {
//   FilterItem({
//     Key?key,
//
//
//     required this.facility
//
//
//   }):super(key:key);
//
//   final faciltiesData facility;
//   int index;
//   List<bool> isswitchedlist;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text((facility.name)!),
//         Switch(
//           value: (state).isswitchedlist[index],
//           onChanged: (value) {
//             setState(() {
//               (state).isswitchedlist[index] = value;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
