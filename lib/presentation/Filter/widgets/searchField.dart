

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/sizeConfig.dart';
final searchcont=TextEditingController();
class SearchField extends StatelessWidget {
  SearchField({
    Key?key,
   this.controller=null,
    required this.onchanged,
    required this.hintText,
    this.isenabled=true,
    required this.prefixIcon,


  }):super(key:key);
   var controller;
  final void Function(String)? onchanged;
  String hintText;
  bool isenabled;
  Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    sizeConfig().init(context);
    return  Card(
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius:  BorderRadius.circular(25.7),

      ),
      elevation: 2.0,
      child: TextField(
        enabled: isenabled,

        controller: controller,
        cursorColor: Colors.grey,
        decoration:    InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.red,
            focusColor: Colors.black,
            hintText: hintText,
            prefixIcon: prefixIcon,

            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius:  BorderRadius.circular(25.7),

            ),
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13)

        ),
        style: TextStyle(color: Colors.grey,fontSize: 18),
        onChanged: onchanged
      ),
    );
  }
}
