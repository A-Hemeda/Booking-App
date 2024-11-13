
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/ProfileCubit/states.dart';
import 'package:hotels_booking_app/presentation/Filter/widgets/hotel_list_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../../busieness_logic/Auth/login_cubit/cubit.dart';
import '../../../busieness_logic/ProfileCubit/cubit.dart';
import '../Widgets/Edit_Profile_widget.dart';

class profile2 extends StatefulWidget {
  profile2({Key? key}) : super(key: key);

  @override
  State<profile2> createState() => _profile2State();
}

class _profile2State extends State<profile2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginCubit.getpref();

  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (BlocProvider
                              .of<ProfileCubit>(context)
                              .profile_info
                              ?.data
                              ?.name)!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                         InkWell(
                          onTap: (){   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );},
                          child: const Text(

                       "View and Edit Profile",
                              style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ),

                      ],
                    ),
                    Spacer(),


                    InkWell(
                      onTap: () async {
                        //   BlocProvider.of<ProfileCubit>(context).image = (await _picker.pickImage(source: ImageSource.gallery))!;

                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            (BlocProvider
                                .of<ProfileCubit>(context)
                                .profile_info
                                ?.data
                                ?.image)=="http://api.mahmoudtaha.com/images"?
                            "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png"
                                :
                            (BlocProvider
                                .of<ProfileCubit>(context)
                                .profile_info
                                ?.data
                                ?.image)!

                        ),
                        radius: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      "Change Password",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Divider(thickness: 0.5, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Invite Friends",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.supervisor_account,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Divider(thickness: 0.5, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Crdit & Coupons",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.card_giftcard,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Divider(thickness: 0.5, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Help Center",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.help_center,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Divider(thickness: 0.5, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Payment",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.payment,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Divider(thickness: 0.5, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Setting",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
