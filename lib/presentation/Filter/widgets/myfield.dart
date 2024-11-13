import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:intl/intl.dart';

import '../../../constants/sizeConfig.dart';
class myfield extends StatelessWidget {
   myfield({
    Key?key,
    required this.title,
    //required this.validatenote,
    this.widget,
    this.controller,
    this.hint,
   this.fun,
     this.type,
     this.widgetStyle= const TextStyle(color: Colors.grey),
     this.readonly=false, this.validate

  }):super(key:key);
  final String title;
  final String? hint;
  final VoidCallback? fun;
   final FormFieldValidator<String>? validate;
  bool?readonly;
   TextInputType? type;
  // String validatenote;
   TextEditingController?controller;
   Widget? widget;
   TextStyle? widgetStyle;
  @override
  Widget build(BuildContext context) {
    sizeConfig().init(context);
    return
      Container(
        padding: const EdgeInsets.only(top: 10,left: 17,right: 17,bottom: 8),

       // padding: const EdgeInsets.only(left: 14,right: 14),

        width: sizeConfig.screenWidth,
       // height: 52,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        Text(title,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold ),),
        SizedBox(height: 7,),
          TextFormField(

            onTap: fun,
            showCursor: false,
            readOnly: readonly!,
          controller: controller,
          keyboardType: type,
          validator: validate,
          style: TextStyle(color: Colors.black),

          decoration:  InputDecoration(
            // labelText: "Design team meeting",
               suffixIcon: widget,
              fillColor: Colors.grey[150],
              hintStyle: widgetStyle,

              hintText: hint,
              // hoverColor: Colors.red,
              filled: true,
              enabledBorder: OutlineInputBorder(

                borderSide: const BorderSide(

                  color: Colors.transparent,
                  width: 1.0,
                ) ,
                borderRadius: BorderRadius.circular(10,),
              )),
        ),


    ],),
      );
  }
}
