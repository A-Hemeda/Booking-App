import 'package:flutter/material.dart';

class sizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
double getProportionateScreenHeight(double inputHeight)
{
  double screenHeight=sizeConfig.screenHeight;
  return(inputHeight/812.0)*screenHeight;


}
double getProportionateScreenWidth(double inputHeight)
{
  double screenWidth=sizeConfig.screenWidth;
  return(inputHeight/812.0)*screenWidth;


}





