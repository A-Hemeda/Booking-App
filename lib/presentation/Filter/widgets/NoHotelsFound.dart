import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoHotelsFound extends StatelessWidget {
  NoHotelsFound({
    Key?key,
    required this.image,
    required this.message,


  }):super(key:key);
  final String image;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 100),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.7,
        child: Column(
          children: [
            SvgPicture.asset(

          image
              , fit:BoxFit.cover,
              height: 200,

            ),
            SizedBox(height: 15),
            Column(
              children:  <Widget>[
                Text(
                 message,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                SizedBox(height: 15),
                // Text(
                //   'You have no tasks to do.',
                //   style: TextStyle(
                //       fontSize: 17,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.grey,
                //       fontFamily: 'opensans'),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
