import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/Auth/login_cubit/cubit.dart';

import '../../../busieness_logic/ProfileCubit/cubit.dart';
import '../../Booking/screens/trips_screen.dart';
import '../../Filter/screens/home/home_explore_screen.dart';
import '../screens/profile2.dart';
import '../../../constants/strings.dart';
class Profile_Widget extends StatefulWidget {
  const Profile_Widget({Key? key}) : super(key: key);

  @override
  State<Profile_Widget> createState() => _Profile_WidgetState();
}

class _Profile_WidgetState extends State<Profile_Widget> {

  int _selectedIndex = 0;
  static  TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("gyyyyyyyyyyyyyyyyyyyyy");
    LoginCubit.getpref();
    BlocProvider.of<ProfileCubit>(context).getprofileinfo((LoginCubit.token)!);
  }
  @override
  Widget build(BuildContext context) {

      List<Widget> _widgetOptions = <Widget>[
      HomeExploreScreen( animationController: econtroller,),
      TripsScreen(),
      profile2(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        print("selected index$index");
      });
    }
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
