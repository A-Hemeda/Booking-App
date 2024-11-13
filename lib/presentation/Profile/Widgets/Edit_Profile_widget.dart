import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../busieness_logic/Auth/login_cubit/cubit.dart';
import '../../../busieness_logic/ProfileCubit/cubit.dart';
import '../../../busieness_logic/ProfileCubit/states.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController Controller_name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController DateOfBirth = TextEditingController();
  TextEditingController Address = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<ProfileCubit>(context).getprofileinfo((LoginCubit.token)!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: (){ BlocProvider.of<ProfileCubit>(context).updateprofileinfo((LoginCubit.token)!, Controller_name.text, Email.text,


              (  BlocProvider.of<ProfileCubit>(context).image)!);
          Navigator.of(context).pop();},
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0.0,
      ),
      body: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 15),
        child: ListView(
          children: [
            const Text(
              "Edit Profile",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
           SizedBox(height: 27,),
            Center(
              child: Stack(
                children: [

    BlocBuilder<ProfileCubit,ProfileState>(
    builder: (context, state) {
      return InkWell(

        child:
        (BlocProvider
            .of<ProfileCubit>(context)
            .image) == null?
        Container(
            padding: EdgeInsets.only(top: 15),
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4,
                    color: Theme
                        .of(context)
                        .scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image:

                DecorationImage(
                  fit: BoxFit.cover,

                  image:


                  NetworkImage(

                      "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png"
             )
                )

            )
        ):

        Container(
          padding: EdgeInsets.only(top: 15),
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
                width: 4,
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 10))
            ],
            shape: BoxShape.circle,


            image: new DecorationImage(
                image: FileImage(File((BlocProvider
                    .of<ProfileCubit>(context)
                    .image?.path)!)
                ),
                fit: BoxFit.cover
            ),


          ),

        ),






        onTap: () async {
          BlocProvider.of<ProfileCubit>(context).pickImage();
          setState(() {

          });
        },
      );
    }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                         // width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: Controller_name,
              decoration: const InputDecoration(

                  labelText: "UserName",
                  labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

                  ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: Email,
              decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Phone,
              decoration: const InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: DateOfBirth,
              decoration: const InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Address,
              decoration: const InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
          ],
        ),
      ),
    );
  }
}
